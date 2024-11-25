require '../stdlib'

if file_exists('../database/contas.yaml')
  tableUsers = readlines '../database/contas.yaml'
  lineCount = len(tableUsers)
  if lineCount==1
    print 'Sem usuarios cadastrados'
  else
    print 'Usuário'
    userInput = input()
    print 'Senha:'
    passInput = input_password('*')
    passInput = hash_sha256(passInput)
    login=false

    for i in [1...lineCount]
      aux = tableUsers[i].split(',')
      aux[0]=aux[0].replace('{ ','')
      aux[1]=aux[1].replace(' }','')
      if aux[0] == userInput && aux[1] == passInput
        login=true
        break
    if login == true
      print 'Bem Vindo '+userInput
      play_sound('../sounds/bemVindo.mp3')
    else
      print 'Usuário ou senha inválida'
      play_sound('../sounds/login.mp3')
else
  print 'Sem usuários cadastrados'

