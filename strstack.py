import argparse

parser = argparse.ArgumentParser()
parser.add_argument('str', nargs='+')
parser.add_argument('--offset', type=int, default=0)
parser.add_argument('--offset-op', default='+', choices=['+', '-'])
parser.add_argument('--base', default='rsp')
args = parser.parse_args()

def divide_chunks(l, n): 
    for i in range(0, len(l), n):  
        yield l[i:i + n] 

def decode_escape(str):
    return str.encode('utf-8').decode('unicode-escape')

def encode_escape(str):
    return str.encode('unicode-escape').decode('utf-8')

offset = args.offset

strs = []

for s in args.str:
    strs.append(decode_escape(s))

for s in strs:
    chunks = list(divide_chunks(s, 4))

    print(f"; `{encode_escape(s)}`")

    for chunk in chunks:
        chunk = encode_escape(chunk)
        print(f"mov [{args.base}{args.offset_op}{offset}], DWORD `{chunk}`")
        offset += 4

    if len(chunks[-1]) == 4: # null terminate
        print(f"mov [{args.base}{args.offset_op}{offset}], DWORD 0")
        offset += 4
