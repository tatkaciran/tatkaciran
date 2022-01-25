import '../constants.dart';

class ScaffoldMessengerShow {
  void internetConnectionBannerAndSnackBar(BuildContext context, bool event) {
    !event
        ? ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanners()
            .showNoInternetConnectionBanner(
                onVisible: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBars()
                      .showNoInternetConnectionSnackBar(
                          context.l10n!.noInternetConnection));
                },
                buttonOnPressed: () =>
                    ScaffoldMessenger.of(context).clearMaterialBanners(),
                title: context.l10n!.noInternetConnection))
        : ScaffoldMessenger.of(context).clearMaterialBanners();
  }
}

class MaterialBanners {
  MaterialBanner showNoInternetConnectionBanner({
    required String title,
    required Function() onVisible,
    required Function() buttonOnPressed,
  }) {
    return MaterialBanner(
      onVisible: onVisible,
      content: SafeArea(child: Text(title)),
      leading: const SafeArea(child: Icon(Icons.warning)),
      backgroundColor: Colors.purpleAccent,
      actions: [
        SafeArea(
          child: TextButton(
            child: const Text('Gizle'),
            onPressed: buttonOnPressed,
          ),
        ),
      ],
    );
  }
}

class SnackBars {
  SnackBar showNoInternetConnectionSnackBar(String title) {
    return SnackBar(content: Text(title));
  }
}
