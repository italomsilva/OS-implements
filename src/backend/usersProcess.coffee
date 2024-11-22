require '../stdlib'

if file_exists('../database/processos.yaml') && file_exists('../database/usuarios.yaml')
  processesList = load_yaml('../database/processos.yaml')
  usersList = load_yaml('../database/usuarios.yaml')
  usersCount = len(usersList)
  processesCount = len(processesList)

  for process in processesList
   for user in usersList
     if user.uid == process.uid
       print 'Processo: '+process.pid+' - '+process.name+': iniciado por '+user.login
  print '\n\nPROCESSOS DOS USUÁRIOS:'
  for user in usersList
    userProcesses = []
    for process in processesList
      if process.uid == user.uid
        simlpleProcess = '{ '+process.pid+' - '+ process.name+' }'
        userProcesses.add(simlpleProcess)
    print user.login+': [ '+userProcesses+' ]'
        

else
  print 'Não há processos e/ou usuários no momento.'