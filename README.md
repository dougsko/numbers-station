Numbers Station
==================

This package contains libraries and tools to do the following things:

- Create one time pads for encryption.
- Encode plain text and decode encoded text using the AT-ONE-SIR straddling checkerboard method.
- Encrypt encoded text and decrypt encrypted text using a one time pad and modulo 10 addition.

# Example Sessions

## Encryption

```bash
Numbers Station
Broadcast quietly...

What would you like to do?
1. Encrypt a message
2. Decrypt a message
3. Create an OTP
4. Print OTP
5. Quit
?  1

Choose a file:  |/home/doug/.otps|


Select an ID:
1. f0887dfe-c9aa-408d-b95c-8a3e4c3cea75
2. 019d98d2-5463-4b11-ac73-4ced60fa6c94
3. 21f55a5c-baef-4f6e-aa97-682df8d05928
?  1

Enter plaintext: hello world
Encrypted message: 9938858035745522
```

## Decryption

```bash
Numbers Station
Broadcast quietly...

What would you like to do?
1. Encrypt a message
2. Decrypt a message
3. Create an OTP
4. Print OTP
5. Quit
?  2

Choose a file:  |/home/doug/.otps|


Select an ID:
1. f0887dfe-c9aa-408d-b95c-8a3e4c3cea75
2. 019d98d2-5463-4b11-ac73-4ced60fa6c94
3. 21f55a5c-baef-4f6e-aa97-682df8d05928
?  1

Enter ciphertext: 9938858035745522
Decrypted message: HELLOWORLD
```
