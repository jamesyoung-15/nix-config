{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    playwright-driver.browsers
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.python-dotenv
      python-pkgs.requests
      python-pkgs.playwright
      python-pkgs.temporalio
      python-pkgs.pyyaml
      python-pkgs.msal
      python-pkgs.beautifulsoup4
    ]))
  ];

  shellHook = ''
    export PLAYWRIGHT_BROWSERS_PATH=${pkgs.playwright-driver.browsers}
    export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=true
  '';
}
