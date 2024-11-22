require '../stdlib'

if file_exists('../database/processos.yaml')
  processesList = load_yaml('../database/processos.yaml')
  ioProcesses = []
  for process in processesList
    if process.io_bound == true
      ioProcesses.add(process)
  if len(ioProcesses)>0
    print ioProcesses
  else
    print 'Não há processos IoBound no momento'
else
  print 'Não há processos no momento.'