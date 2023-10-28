# reference: https://smartcontracts.org/docs/interface-spec/index.html#certification

'''
A certificate consists of:
    - a tree
    - a signature on the tree root hash valid under some public key
    - an optional delegation that links that public key to root public key.

Certificate = {
  tree : HashTree
  signature : Signature
  delegation : NoDelegation | Delegation
}
HashTree
  = Empty
  | Fork HashTree HashTree
  | Labeled Label HashTree
  | Leaf blob
  | Pruned Hash
Label = Blob
Hash = Blob
Signature = Blob

Lookup:

    lookup(path, cert) = lookup_path(path, cert.tree)

    lookup_path([], Empty) = Absent
    lookup_path([], Leaf v) = v
    lookup_path([], Pruned _) = Unknown
    lookup_path([], Labeled _ _) = Error
    lookup_path([], Fork _ _) = Error

    lookup_path(l::ls, tree) =
      match find_label(l, flatten_forks(tree)) with
      | Absent -> Absent
      | Unknown -> Unknown
      | Error -> Error
      | Found subtree -> lookup_path ls subtree

    flatten_forks(Empty) = []
    flatten_forks(Fork t1 t2) = flatten_forks(t1) · flatten_forks(t2)
    flatten_forks(t) = [t]

    find_label(l, _ · Labeled l1 t · _)                | l == l1     = Found t
    find_label(l, _ · Labeled l1 _ · Labeled l2 _ · _) | l1 < l < l2 = Absent
    find_label(l,                    Labeled l2 _ · _) |      l < l2 = Absent
    find_label(l, _ · Labeled l1 _ )                   | l1 < l      = Absent
    find_label(l, [])                                                = Absent
    find_label(l, _)                                                 = Unknown
'''
from enum import Enum

class NodeId(Enum):
    Empty = 0
    Fork = 1
    Labeled = 2
    Leaf = 3
    Pruned = 4

def lookup(path, cert):
    return lookup_path(path, cert['tree'])

def lookup_path(path, tree):
    offset = 0
    if len(path) == 0:
        if tree[0] == NodeId.Leaf.value:
          return tree[1]
        else:
          return None
    label = path[0].encode() if type(path[0]) == str else path[0]
    t = find_label(label, flatten_forks(tree))
    if t:
      offset +=1
      return lookup_path(path[offset:], t)


def flatten_forks(t):
  if t[0] == NodeId.Empty.value:
      return []
  elif t[0] == NodeId.Fork.value:
      val1 = flatten_forks(t[1])
      val2 = flatten_forks(t[2])
      val1.extend(val2)
      return val1
  else:
      return [t]

def find_label(l, trees):
    if len(trees) == 0:
        return None
    for t in trees:
        if t[0] == NodeId.Labeled.value:
            p = t[1]
            if l == p :
                return t[2]

if __name__=='__main__':
    tree = [1, [4, b'W\xb4\x1b\x00\xc9x\xc0\xcb\\\xf4\xb6\xa1\xbbE\\\x9fr\xe2\x1a8\xd2bE\x14\x11\xab:\xb5\x1b`\x98\x9d'], [1, [4, b'\xac>_\x80\xeb.$\x9c\x00\xbc\x12\xce&!^\xa8,i\x08\xaeH\x8e\x9ce9\x87\xbahGPo\xe6'], [2, b'time', [3, b'\xd2\xac\xd3\x8a\xfc\xa0\xd0\xe0\x16']]]]
    tree2 = [1, [4, b'5J\xe2\x98A\x8d5\xc8\xe6\x94V\xc9\x90\x87\x00\xc9:\xe1\xb3i\x91fS\xc0udD\x19mQ\x1c\x85'], [1, [4, b'\xac>_\x80\xeb.$\x9c\x00\xbc\x12\xce&!^\xa8,i\x08\xaeH\x8e\x9ce9\x87\xbahGPo\xe6'], [2, b'time', [3, b'\xe7\xfc\xcf\x90\x87\x85\xd0\xe0\x16']]]]
    path = b'time'
    print(lookup_path([path], tree))