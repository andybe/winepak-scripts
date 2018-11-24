# clear everything "beware of this" - flatpak list | awk '{ print $1}' | xargs flatpak remove -y
###################################
# add flatpak repo flathub        #
###################################
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

###################################
# install org.freedesktop base    #
###################################
flatpak install flathub org.freedesktop.Sdk/i386/1.6 org.freedesktop.Sdk/x86_64/1.6 org.freedesktop.Platform/i386/1.6 org.freedesktop.Platform/x86_64/1.6

###################################
# create local repository         #
###################################
flatpak --user remote-add --no-gpg-verify --if-not-exists winepak winepak-repo

###################################
# build the winepak stack         #
###################################
flatpak-builder --arch=i386 --ccache --keep-build-dirs --force-clean --repo=winepak-repo builds/winepak-sdk-images-i386  winepak-sdk-images/org.winepak.Sdk.yml
flatpak-builder --arch=x86_64 --ccache --keep-build-dirs --force-clean --repo=winepak-repo builds/winepak-sdk-images-x86_64  winepak-sdk-images/org.winepak.Sdk.yml
flatpak build-commit-from --verbose --src-ref=runtime/org.winepak.Sdk/i386/1.6 winepak-repo runtime/org.winepak.Sdk.Compat32/x86_64/1.6
flatpak build-commit-from --verbose --src-ref=runtime/org.winepak.Platform/i386/1.6 winepak-repo runtime/org.winepak.Platform.Compat32/x86_64/1.6
