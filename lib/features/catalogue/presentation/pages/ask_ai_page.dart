import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tlb_app/features/catalogue/presentation/bloc/catalogue_bloc.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/catalogue_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/ai_result.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/ask_ai_form.dart';
import 'package:tlb_app/my_app.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class AskAiPage extends StatefulWidget {
  const AskAiPage({super.key});

  @override
  _AskAiPageState createState() => _AskAiPageState();
}

class _AskAiPageState extends State<AskAiPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isExplanationVisible = false;
  Map<String, dynamic> _formData = {};
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _submitData(_formData);
    }
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _submitData(Map<String, dynamic> answers) {
    final prompt = _generatePrompt(answers);
    print(prompt);
    _sendPromptToGemini(prompt);
  }

  String _generatePrompt(Map<String, dynamic> answers) {
    return """
    Katalog: Messi Gondrong,Ronaldo Brazil,Spaghetti Ronaldo,Balotelli Mohawk,Rastaman Gullit,TMNT Mbappe,Rijkaard Classic,Beckham Curtains.
    Berikan saya rekomendasi gaya rambut laki-laki yang sesuai dengan karakteristik berikut dan katalog yang tersedia di atas, dan berikan alasannya, berikan jawaban dalam satu paragraf dan jangan memberikan output text style bold:
    Bentuk wajah: ${answers['question1']}
    Tekstur rambut: ${answers['question2']}
    Ketebalan rambut: ${answers['question3']}
    Postur tubuh: ${answers['question4']}
    Deskripsi diri: ${answers['question5']}
    Usia: ${answers['question6']}
    """;
  }

  Future<void> _sendPromptToGemini(String prompt) async {
    try {
      Gemini.init(apiKey: dotenv.env['GEMINI_API_KEY']!);
      final value = await Gemini.instance.prompt(parts: [
        Part.text(prompt),
      ]);

      if (value == null || value.output == null) {
        throw Exception('Respons kosong dari Gemini.');
      }

      final result = value.output?.toString() ?? '';
      print('Respons Gemini: $result');
      _navigateToAiResult(result);
    } catch (e) {
      print('Error saat mengirim prompt ke Gemini: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  String _aiResult = '';

  void _navigateToAiResult(String result) {
    if (result.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mendapatkan hasil dari AI.')),
      );
      return;
    }

    setState(() {
      _aiResult = result;
      _isExplanationVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tanya AI',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(children: [
                    Text(
                      StringResource.introAskAI,
                      style: TextStyle(fontSize: 14, color: ColorResource.text),
                    ),
                    SizedBox(height: 12),
                    Form(
                      key: _formKey,
                      child: AskAiForm(
                        onSubmit: (data) {
                          setState(() {
                            _formData = data;
                            _isExplanationVisible = true;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _submitForm,
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Generate Jawaban AI',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_circle_down_rounded,
                            size: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorResource.primary,
                        foregroundColor: Colors.white,
                        minimumSize: Size(300, 69),
                        fixedSize: Size(350, 69),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        textStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (_isExplanationVisible)
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            height: 400,
                            width: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.list_alt_outlined,
                                        size: 30,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Penjelasan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: AiResult(result: _aiResult),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          BlocConsumer<CatalogueBloc, CatalogueState>(
                            listener: (context, state) {
                              // Handle state changes
                            },
                            builder: (context, state) {
                              if (state is CatalogueLoaded) {
                                final topThreeItems =
                                    state.catalogue.catalogues.take(3).toList();

                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: CatalogueCard(
                                    catalogue: state.catalogue,
                                    items: topThreeItems,
                                    scrollController: _scrollController,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                  ),
                                );
                              }
                              return Center(child: Text("No Data"));
                            },
                          ),
                        ],
                      )
                  ]),
                ),
              ),
              // BlocConsumer di luar SingleChildScrollView
            )
          ],
        ),
      ),
    );
  }
}
