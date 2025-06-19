:: strip debug symbols
:: SET RUSTFLAGS=-C strip=symbols -C codegen-units=1 -C linker=lld
SET RUSTFLAGS=-C strip=symbols -C codegen-units=1
SET CARGO_BUILD_JOBS=1
SET CARGO_PROFILE_RELEASE_OPT_LEVEL=0

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
