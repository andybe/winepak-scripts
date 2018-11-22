flatpak --user remote-add --no-gpg-verify --if-not-exists winepak winepak-repo
flatpak-builder --arch=i386 --ccache --keep-build-dirs --force-clean --repo=winepak-repo builds/winepak-sdk-images-i386  winepak-sdk-images/org.winepak.Sdk.yml
flatpak-builder --arch=x86_64 --ccache --keep-build-dirs --force-clean --repo=winepak-repo builds/winepak-sdk-images-x86_64  winepak-sdk-images/org.winepak.Sdk.yml
flatpak build-commit-from --verbose --src-ref=runtime/org.winepak.Sdk/i386/3.0 winepak-repo runtime/org.winepak.Sdk.Compat32/x86_64/3.0
flatpak build-commit-from --verbose --src-ref=runtime/org.winepak.Platform/i386/3.0 winepak-repo runtime/org.winepak.Platform.Compat32/x86_64/3.0