#!/bin/sh

echo "Preparing the infraestructure Canister"
dfx canister create --all
dfx build

dfx canister install --all
dfx canister install --all --mode=upgrade

echo "INSERT DATA"
dfx canister call etc_icp_db insert '("1",record { Ope = "OPE1"; StrToll = "OPE2WWWXXXYYYZZZ"; Status = "N" })'
dfx canister call etc_icp_db insert '("2",record { Ope = "OPE2"; StrToll = "OPE2WWWXXXYYYZZZ"; Status = "N" })'
dfx canister call etc_icp_db insert '("3",record { Ope = "OPE3"; StrToll = "OPE3WWWXXXYYYZZZ"; Status = "N" })'
dfx canister call etc_icp_db insert '("4",record { Ope = "OPE4"; StrToll = "OPE4WWWXXXYYYZZZ"; Status = "N" })'
dfx canister call etc_icp_db insert '("5",record { Ope = "OPE4"; StrToll = "OPE3WWWXXXYYYZZZ"; Status = "N" })'

echo "SIZE OF DATA RECORDED"
dfx canister call etc_icp_db size

echo "Just checking Database OPES ..."
dfx canister call etc_icp_db_ope1 list
dfx canister call etc_icp_db_ope2 list
dfx canister call etc_icp_db_ope3 list
dfx canister call etc_icp_db_ope4 list
