import 'package:finance_ai/ui/new_expense/view_models/new_expense_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({
    super.key,
    required this.viewModel,
  });

  final NewExpenseViewModel viewModel;

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getImage.addListener(_onResult);
    widget.viewModel.processImageToText.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant NewExpenseScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.getImage.removeListener(_onResult);
    oldWidget.viewModel.processImageToText.removeListener(_onResult);
    widget.viewModel.getImage.addListener(_onResult);
    widget.viewModel.processImageToText.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.getImage.removeListener(_onResult);
    widget.viewModel.processImageToText.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        body: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Adicionar novo gasto",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.viewModel.image != null
                                ? SizedBox(
                                    height: 350,
                                    width: 350,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.file(widget.viewModel.image!),
                                      ],
                                    ),
                                  )
                                : const Icon(
                                    Icons.image,
                                    size: 200,
                                  ),
                            const SizedBox(
                              height: 18,
                            ),
                            if (widget.viewModel.image != null)
                              SizedBox(
                                width: size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    widget.viewModel.textImage ?? '',
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(
                                      double.infinity,
                                      50,
                                    ),
                                    backgroundColor: Colors.blue,
                                  ),
                                  onPressed: () async {
                                    await widget.viewModel.getImage
                                        .execute(ImageSource.gallery);

                                    await widget.viewModel.processImageToText
                                        .execute();
                                  },
                                  child: const Text(
                                    'Selecionar Imagem',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
