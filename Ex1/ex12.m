% Ricerca degli errori sintattici

a = 2y+(((3+1)9);

  % Manca una parentesi e la variabile y non risulta inizializzata

b == 2*sin[3];

  %{
     L'operatore "==" è un operatore di testing non di 
     assegnamento, ma non essendo la variabile b inizializzata
     non ha senso testarne l'uguaglianza.
     Il secondo errore è l'ultilizzo delle parentesi quadre in quanto, 
     per riferirsi all'argomento di una funzione vanno usate le
     parentesi tonde.
  %} 

c = e^0.5;

  %{
     Il modo corretto per ottenere la radice del numero di nepero
     è c = exp(0.5).
  %}

d = log(4-8/4*2)

  %{
     In questo modo non essendo certi della precedenza degli operatori
     rischiamo di tentare di calcolare log(0), occorre aggiungere le
     parentesi e riscrivere la formula come
     d = log(4-8/(4*2)) 
  %}



