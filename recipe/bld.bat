:: strip debug symbols
SET RUSTFLAGS=-C strip=symbols

:: check licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

:: build
cargo install --locked --root "%LIBRARY_PREFIX%" --path crates/cli || goto :error

:: remove extra build file
del /F /Q "%LIBRARY_PREFIX%\.crates.toml"

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
