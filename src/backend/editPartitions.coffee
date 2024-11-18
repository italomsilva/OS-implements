require '../stdlib'
partitionsList = []
freeSize = 100
if file_exists('../database/particoes.yaml')
  partitionsList = load_yaml('../database/particoes.yaml')
  for part in partitionsList
    freeSize -= part.tamanho
print 'Quantas particoes deseja criar?'
qtdPart=input()
for i in [0...qtdPart]
  print 'Tamanho da particao: '
  sizePart = input()
  if sizePart=="-1"
    sizePart=freeSize
  if (freeSize-sizePart >= 0)
    print 'Tipo da particao:\n1.Primaria\t2.Lógica\t3.Estendida'
    typePart = input()
    typesPart = ['primaria','logica' ,'estendida']
    newPart = {
        tamanho: Number(sizePart),
        tipo: typesPart[typePart-1]
    }
    freeSize-=sizePart
    partitionsList.add(newPart)
    save_yaml '../database/particoes.yaml', partitionsList
  else
    print 'Espaço insuficiente'