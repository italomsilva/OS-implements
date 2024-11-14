require '../stdlib'

if file_exists('../database/users.yaml')
  tableUsers = readlines "../database/users.yaml"
else
  tableUsers = []

lineCount = len(tableUsers)

print 'Usuário:'
userInput = input()
print 'Senha:'
passInput = input_password('*')
passInput = hash_sha256(passInput)

userIndex=-1

for i in [1...lineCount]
    aux = tableUsers[i].split(',')
    aux[0] = aux[0].replace('{ ', '')
    aux[1] = aux[1].replace(' }', '')
    if aux[0] == userInput && aux[1] == passInput
      userIndex = i
      break

if userIndex==-1
  print "usuario nao encontrado ou credenciais invalidas"
else
  tableUsers.splice(i,1)
  print "Usuário removido com sucesso."
  writelines "../database/users.yaml", tableUsers

