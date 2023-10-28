#!/bin/sh

echo "Just checking DB OPES ..."

dfx canister call etc_icp_db_ope1 list
dfx canister call etc_icp_db_ope2 list
dfx canister call etc_icp_db_ope3 list
dfx canister call etc_icp_db_ope4 list
