import asyncio
from ic.agent import *
from ic.identity import *
from ic.client import *
from ic.candid import Types, encode

client = Client(url = "http://127.0.0.1:4943")

iden = Identity(privkey="6af3ca5313e053186f3f45919bad90c4a64bd5cfe235cb0d5e2176c104a00cce")
print('principal:', Principal.self_authenticating(iden.der_pubkey))
ag = Agent(iden, client)
print(ag)
start = time.time()

ret = ag.update_raw("bkyz2-fmaaa-aaaaa-qaaaq-cai", "greet", encode([{'type': Types.Text,'value':'Okokok'}]))
print('greet:', ret)
