import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instajobs/config/config.dart';
import 'package:instajobs/constants/extensions/extensions.dart';
import 'package:instajobs/presentation/auth/auth.dart';
import 'package:instajobs/presentation/home/home.dart';
import 'package:intl/intl.dart';
import 'package:jobs_repository/jobs_repository.dart';

class JobItemManager extends ChangeNotifier {
  final Job _job;

  JobItemManager(this._job);

  //! Job
  Job get job => _job;

  //! User ID
  String uuID(BuildContext context) =>
      context.select((AuthenticationBloc bloc) => bloc.state.user.id);

  //! Is equal User ID with Job User ID?
  bool isUser(BuildContext context) => _job.userID == uuID(context);

  //! Expiry Date View
  String get expiryDateLabel => 'Son ${_job.expiryDate} gün';

  //! Username View
  String get usernameLabel => '@${_job.userName}';

  //! Job Item View
  Color backgroundColor(BuildContext context) => context.theme.highlightColor;
  EdgeInsets get margin => const EdgeInsets.only(
        top: 12.0,
        left: 12.0,
        right: 12.0,
      );

  //! Hide Button View
  String get hideButtonLabel => _job.isHidden! ? 'View Job' : 'Hide Job';
  IconData get hideButtonIcon =>
      _job.isHidden! ? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill;
  void hideButtonOnPressed(BuildContext context) {
    context.read<JobsBloc>().add(UpdateJob(_job.copyWith(
          isHidden: !_job.isHidden!,
        )));
    notifyListeners();
  }

  //! Delete Button View
  String get deleteButtonLabel => 'Delete Job';
  IconData get deleteButtonIcon => CupertinoIcons.delete_solid;
  void deleteButtonOnPressed(BuildContext context) {
    context.read<JobsBloc>().add(DeleteJob(Job(jobID: _job.jobID)));
    notifyListeners();
  }

  //! Apply Button View
  String get applyButtonLabel => 'Apply';
  ButtonStyle? applyButtonStyle(BuildContext context) =>
      context.theme.elevatedButtonTheme.style;
  EdgeInsets get applyButtonPadding => const EdgeInsets.only(bottom: 6.0);
  void applyButtonOnPressed(BuildContext context) {
    context.read<ChatManager>().fromJobToChat(context, _job);
    context.read<NavigationBloc>().add(const NavigationEvent.showChat(true));
    notifyListeners();
  }

  //! Job Detail Button View

  String get detailButtonLabel => 'Detail';
  ButtonStyle? detailButtonStyle(BuildContext context) =>
      context.theme.elevatedButtonTheme.style;
  EdgeInsets get detailButtonPadding => const EdgeInsets.only(bottom: 6.0);
  void detailButtonOnPressed(BuildContext context) {
    // context.read<ChatManager>().fromJobToChat(context, _job);
    // context.read<NavigationStateManager>().showChat(true);
    notifyListeners();
  }

  //! Salary View
  // String get _salaryRawText => _job.salary;
  final salaryFormat = NumberFormat("###,###.###");

  String get _salaryText => salaryFormat
      .format(int.parse(_job.salary!.replaceAll('.', '')).truncate());
  String get salaryLabel => '$_salaryText TL';

  //! Address View
  // Address get _address =>
  //     Address.fromEntity(AddressEntity.fromJson(_job.address!.cast()));
  String get addressLabel => 'türkiye';

  //! Description View
  bool _isDescriptionExtended = false;
  bool get isDescriptionExtended => _isDescriptionExtended;
  void extendDescriptionToggle() {
    _isDescriptionExtended = !_isDescriptionExtended;
    notifyListeners();
  }

  final int _descriptionLabelLengthLimit = 140;

  String get descriptionText => _job.description!;
  String get descriptionLabel =>
      _isDescriptionExtended ? descriptionText : _limitedDescriptionLabel;

  String get _limitedDescriptionRawText =>
      descriptionText.substring(0, _descriptionLabelLengthLimit);
  String get _limitedDescriptionLabel =>
      descriptionText.length >= _descriptionLabelLengthLimit
          ? '$_limitedDescriptionRawText... $_clickForDetailTitle'
          : descriptionText;

  final String _clickForDetailTitle = 'read more';

  TextStyle get descriptionLabelStyle => const TextStyle(
        fontSize: 16,
        letterSpacing: 0.7,
      );
  EdgeInsets get descriptionPadding => const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      );
}
