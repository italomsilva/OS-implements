require '../stdlib'

if file_exists('../database/contas.yaml')
  tableUsers = readlines('../database/contas.yaml')
  usersCount = len(tableUsers)
  if usersCount==1
    print 'Sem usuários para sortear'
  else
    drawResult = random 1,(usersCount-1)
    drawnUser = tableUsers[drawResult].split(',')
    drawnUser = drawnUser[0].replace("{ ", '')
    print 'Parabens '+drawnUser+'! Você ganhou um prêmio!'
else
  print 'Sem usuarios cadastrados'