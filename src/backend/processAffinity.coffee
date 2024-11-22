require '../stdlib'

if file_exists('../database/processos.yaml')
  processesList = load_yaml('../database/processos.yaml')
  for core in [0...4]
    coreProcesses =[]
    for process in processesList
      processAffinities = process.affinity
      if processAffinities.includes(core)
        simlpleProcess = '{ '+process.pid+' - '+process.name+' }'
        coreProcesses.add(simlpleProcess)
    print 'Núcleo['+core+']: [ '+coreProcesses+' ]'
else
  print 'Não há processos no momento.'