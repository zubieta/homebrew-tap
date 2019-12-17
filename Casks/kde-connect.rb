cask "kdeconnect" do
  version "master"
  sha256 "https://binary-factory.kde.org/view/MacOS/job/kdeconnect-kde_Nightly_macos/lastSuccessfulBuild/artifact/kdeconnect-kde-master-645-macos-64-clang.dmg.sha256"

  url "https://binary-factory.kde.org/view/MacOS/job/kdeconnect-kde_Nightly_macos/lastSuccessfulBuild/artifact/kdeconnect-kde-master-645-macos-64-clang.dmg"
  appscast ""
  name "KDEConnect"
  home "https://community.kde.org/KDEConnect"

  auto_updates true?
  depends_on macos: ">= :catalina"

  app "KDEConnect.app"

  zap trash: [


  ]
end
