import asyncio
from ic.agent import *
from ic.identity import *
from ic.client import *
from ic.candid import Types, encode

client = Client(url = "http://127.0.0.1:4943")

iden = Identity(privkey="35be4e5b9004d228fdf77e3d70e4e7d4824a0cf4ab901d6e9f3e33aa6e46734b")

print('principal:', Principal.self_authenticating(iden.der_pubkey))
ag = Agent(iden, client)
print(ag)
start = time.time()

#'("1",record { Ope = "OPE1"; StrToll = "OPE2WWWXXXYYYZZZ"; Status = "N" })'

record = Types.Record({ 'Ope': Types.Text, 'StrToll': Types.Text, 'Status': Types.Text })

ret = ag.update_raw("bkyz2-fmaaa-aaaaa-qaaaq-cai", "insert", encode([

        {'type': Types.Text,'value': '6'}, 
        {'type': record, 'value':
            {'Ope':'OPE1','StrToll':'OPE2WWWXXXYYYZZZ','Status':'N'}
        }
    ]))

print('etc_db insert:', ret)
