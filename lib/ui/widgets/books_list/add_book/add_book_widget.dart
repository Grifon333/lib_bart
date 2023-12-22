import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/library/widgets/inherited/provider.dart';
import 'package:lib_bart/ui/widgets/books_list/add_book/add_book_model.dart';

class AddBookWidget extends StatelessWidget {
  const AddBookWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: MainColors.color1,
      child: SafeArea(
        child: Column(
          children: const [
            _UpBarWidget(),
            _FieldsWidget(),
            _SubmitWidget(),
          ],
        ),
      ),
    );
  }
}

class _UpBarWidget extends StatelessWidget {
  const _UpBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: const [
          ColoredBox(
            color: Colors.black,
            child: SizedBox(
              height: 2,
              width: double.infinity,
            ),
          ),
          Text(
            'Add Book',
            style: TextStyle(fontSize: 64, color: MainColors.color2),
          ),
          ColoredBox(
            color: Colors.black,
            child: SizedBox(
              height: 2,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldsWidget extends StatelessWidget {
  const _FieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AddBookModel>(context);
    if (model == null) return const SizedBox.shrink();
    final parameters = model.parameters;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (context, index) {
          return _FieldForCreateBook(
            title: parameters[index][0],
            labelText: parameters[index][1],
            maxLines: parameters[index][2],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: parameters.length,
      ),
    );
  }
}

class _FieldForCreateBook extends StatelessWidget {
  final String title;
  final String labelText;
  final int maxLines;

  const _FieldForCreateBook({
    Key? key,
    required this.title,
    required this.labelText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AddBookModel>(context);
    if (model == null) return const SizedBox.shrink();
    final errorFields = model.errorFields;

    return TextField(
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorFields.contains(title) ? Colors.red : Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorFields.contains(title) ? Colors.red : Colors.black,
          ),
        ),
        isCollapsed: true,
        contentPadding: const EdgeInsets.all(8),
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(200, 200, 200, 1),
        ),
      ),
      onChanged: (val) {
        model.addField(title, val);
      },
      // onSubmitted: (val) {
      //   model.addField(title, val);
      // },
      maxLines: maxLines,
    );
  }
}

class _SubmitWidget extends StatelessWidget {
  const _SubmitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<AddBookModel>(context);
    if (model == null) return const SizedBox.shrink();

    return ElevatedButton(
      onPressed: () async {
        bool result = await model.addBook();
        if (!result) {
          print('Error');
        } else {
          print('Good');
          Navigator.of(context).pop();
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.orange),
      ),
      child: const Text(
        'Add',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
