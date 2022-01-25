import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/ui/chat/chat.dart';

class SendMessageFormField extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SendMessageFormField(this.formKey, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        validator: (value) {
          return value!.isEmpty ? 'boş olamaz' : null;
        },
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          // errorText: 'boş olamaz',
          border: InputBorder.none,
          hintText: 'mesaj yaz...',
          filled: true,
        ),
        onChanged: (value) {
          context.read<ContentBloc>().add(SetContent(value));
        },
        onFieldSubmitted: (value) {
          context.read<ContentBloc>().add(SetContent(value));
        },
      ),
    );
  }
}
