require '../stdlib'
langs = readlines('../database/lang.config')
print 'Idioma desejado:'
langSelec = input()

for x in langs
  lang=x.split(':')
  if lang[0]==langSelec
    print lang[1]