flatpak-builder --arch=i386 --ccache --keep-build-dirs --force-clean --repo=winepak-repo builds/winepak-sdk-images-wine-3.20-staging-i386 winepak-sdk-images/wine/3.20-staging/org.winepak.Platform.Wine.yml
#flatpak-builder --arch=x86_64 --ccache --keep-build-dirs --force-clean --repo=winepak-repo builds/winepak-sdk-images-wine-3.20-staging-x86_64 winepak-sdk-images/wine/3.20-staging/org.winepak.Platform.Wine.yml
#flatpak build-commit-from --verbose --src-ref=runtime/org.winepak.Platform.Wine/i386/3.20-staging winepak-repo runtime/org.winepak.Platform.Wine.Compat32/x86_64/3.20-staging

