require '../stdlib'


if file_exists('../database/contas.yaml')
  if file_exists('../database/hd.yaml')
    tableUsers = readlines('../database/contas.yaml')
    lineCount = len(tableUsers)
    files = load_yaml('../database/hd.yaml')
    if lineCount>1
      for i in [1...lineCount]
        user = tableUsers[i].split(',')
        user = user[0].replace("{ ", '')
        biggestFile={tamanho: 0}
        for file in files
          if file.usuario==user && file.tamanho > biggestFile.tamanho
            biggestFile = file
        print 'O maior arquivo do usuário '+user+' é: '+biggestFile.arquivo+', de tamanho '+biggestFile.tamanho+'MB'
    else
      print 'Sem usuários cadstrados'
  else
    print 'Hd não detectado'
else
  print 'Sem usuários cadstrados'