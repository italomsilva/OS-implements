require '../stdlib'

if file_exists('../database/processos.yaml')
  processesList = load_yaml('../database/processos.yaml')
  readyProcesses = []
  runningProcesses = []
  blockedProcesses = []
  for process in processesList
    if process.state == 'ready'
      readyProcesses.add(process)
    if process.state == 'running'
      runningProcesses.add(process)
    if process.state == 'blocked'
      blockedProcesses.add(process)
  if len(readyProcesses)>0
    print '-----Processos \'ready\'-----'
    print readyProcesses
  else
    print '-----Não há processos \'ready\'-----'

  if len(runningProcesses)>0
    print '-----Processos \'running\'-----'
    print runningProcesses
  else
    print '-----Não há processos \'running\'-----'

  if len(blockedProcesses)>0
    print '-----Processos \'blocked\'-----'
    print blockedProcesses
  else
    print '-----Não há processos \'blocked\'-----'
  
else
  print 'Não há processos no momento.'