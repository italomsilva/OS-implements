require '../stdlib'

if file_exists('../database/contas.yaml')
  tableUsers = readlines "../database/contas.yaml"
  lineCount = len(tableUsers)
  if lineCount>1
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
      writelines "../database/contas.yaml", tableUsers
  else
    print 'Sem Usuários cadastrados'
else
  print 'Sem Usuários cadastrados'
