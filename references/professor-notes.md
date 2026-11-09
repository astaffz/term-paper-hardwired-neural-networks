# Ožičeno programiranje neuralnih mreža — prijedlog poglavlja (prof. Ribić)

## 1. Opis formalnog neurona i principa neuralnih mreža

Profesor nije naveo izvore za ovo poglavlje.

## 2. Istorijski počeci: analogni i elektromehanički hardver

Prve hardverske realizacije bile su zasnovane na fizičkim otpornicima, motorima i
analognim kolima, jer tadašnji računari nisu imali dovoljnu procesorsku snagu.

- **Mark I Perceptron (1957/1958)** — prva fizička implementacija neuronske mreže, razvio
  ju je Frank Rosenblatt. Sinaptičke težine simulirane su elektromotorima koji okreću
  potenciometre. Izvori: [1], [2].
- **ADALINE i MADALINE (1959/1962)** — Bernard Widrow i Ted Hoff razvili su ADALINE
  (Adaptive Linear Neuron) koristeći komponente zvane *memistori* (otpornici s memorijom).
  Izvor: [3].

## 3. Tranzicija ka VLSI i FPGA

Razvojem silicijumske tehnologije (VLSI — Very Large Scale Integration) tokom 1980-ih i
1990-ih fokus se prebacio na integrisana kola specifične namjene (ASIC) i programabilne
logičke nizove (FPGA).

- Pregled prelaska s von Neumannove arhitekture na namjenske VLSI sisteme: [4].
- Vodič kroz digitalne, analogne i hibridne sisteme: [5].
- Savremena optimizacija hardvera i potrošnje (od stotina vati do milivata): [6].

## 4. Specijalizovana integrisana kola (AI ASIC / TPU)

Era dubokog učenja donijela je potrebu za masovnim matričnim množenjem (MAC operacije,
*multiply-accumulate*), što je dovelo do namjenskih akceleratora za duboko učenje.

- Teorijska osnova: kako se matematički model preslikava na hardverske matrice otpornika
  i *crossbar* nizove: [7].
- Hardverska ograničenja i arhitekturna rješenja (Google TPU, IBM ZISC, CNAPS): [8].

## 5. Neuromorfni čipovi

Za razliku od klasičnih akceleratora, neuromorfni čipovi imitiraju biološki rad mozga u
realnom vremenu: obrada je vođena događajima (*event-driven*), a mreže su impulsne
(*spiking neural networks*, SNN).

- Baza znanja o čipovima kao što su Intel Loihi, IBM TrueNorth i SpiNNaker: [9].
- Otvoreni projekti s hardverskim kodom (VHDL, Verilog, SystemVerilog) za digitalne i
  asinhrone neuromorfne procesore: [10].
- Buduće tehnologije: memristori i RRAM, koji emuliraju sinaptičke težine na atomskom
  nivou: [11].

## Izvori

| # | Rad / stranica | Pogl. | Link |
|---|---|---|---|
| 1 | Wikipedia: *History of artificial neural networks* | 2 | https://en.wikipedia.org/wiki/History_of_artificial_neural_networks |
| 2 | Galileo Unbound (blog): *A short history of neural networks* (2025) | 2 | https://galileo-unbound.blog/2025/02/05/a-short-history-of-neural-networks/ |
| 3 | Stanford (E. Roberts, Sophomore College): *Neural Networks — History* | 2 | https://cs.stanford.edu/people/eroberts/courses/soco/projects/neural-networks/History/history1.html |
| 4 | *A historical survey of algorithms and hardware architectures for neural-inspired and neuromorphic computing applications* (ScienceDirect) | 3 | https://www.sciencedirect.com/science/article/am/pii/S2212683X16300561 |
| 5 | Schuman i dr. (2017): *A Survey of Neuromorphic Computing and Neural Networks in Hardware* | 3 | https://arxiv.org/abs/1705.06963 |
| 6 | *Hardware Implementation of Neural Networks* (ResearchGate) | 3 | https://www.researchgate.net/publication/385988727_Hardware_Implementation_of_Neural_Networks |
| 7 | Gopalakrishnan, Chua, Kumar (2019): *Hardware-friendly Neural Network Architecture for Neuromorphic Computing* | 4 | https://arxiv.org/html/1906.08853v1 |
| 8 | *Hardware Implementation of Neural Network Using VHDL* (IJECCE) | 4 | https://ijecce.org/administrator/components/com_jresearch/files/publications/IJECCE_671_1_FInal.pdf |
| 9 | Open Neuromorphic: *Neuromorphic Hardware Guide* | 5 | https://open-neuromorphic.org/neuromorphic-computing/hardware/ |
| 10 | GitHub: *Awesome Neuromorphic HW* | 5 | https://github.com/open-neuromorphic/awesome-neuromorphic-hw/blob/main/README.md |
| 11 | River Publishers, poglavlje: *Technology and Hardware for Neuromorphic Computing* | 5 | https://www.riverpublishers.com/downloadchapter.php?file=RP_9788770226103C2.pdf |

## Napomene uz uređivanje

- Oznake `[1]`, `[1, 2]` u izvornom tekstu ponavljale su se bez reda; zamijenjene su
  brojevima iz tabele izvora.
- Izvor [5] profesor navodi (kao PDF na ResearchGate), ali ga nema u listi linkova;
  dodat je otvoreni link na arXiv.
- Naslovi [7] i [8] provjereni su na samim stranicama 2026-11-09. Rad [7] se bavi
  preslikavanjem mreže na neuromorfne čipove (TrueNorth, Loihi), pa koristi i za pogl. 5.
- Za provjeru u izvorima (nije od profesora): memistor je obično opisan kao
  elektrohemijski, a ne elektromehanički element; ADALINE se najčešće datira u 1960.

<details>
<summary>Izvorni tekst (neizmijenjen)</summary>

```text
Ovaj rad ne ide standardnom metodologijom, nego predlazem sljedeca poglavlja
Opis formalnog neurona i principa neuralnih mreza
Istorijski poceci: Analogni i elektroehanicki hardver
Prve hardverske realizacije bile su zasnovane na fizickim otpornicima, motorima i analognim kolima jer tadasnji racunari nisu imali dovoljnu procesorsku snagu.
Mark I Perceptron (1957/1958): Prva fizicka implementacija neuronske mreze koju je razvio Frank Rosenblatt. Koristila je elektromotore (potenciometre) za simulaciju sinaptickih tezina. Detalje o nastanku i konceptu mozete procitati u istorijskom pregledu na Wikipedia - History of Artificial Neural Networks, kao i u analizi Galileo Unbound blog. [1, 2]
ADALINE i MADALINE (1959/1962): Bernard Widrow i Ted Hoff razvili su ADALINE (Adaptive Linear Neuron) koristeci elektromehanicke komponente zvane "memistori" (fizicki otpornici s memorijom). Istorijat ovih ranih sistema opisan je na Stanford University - Neural Networks History. [1] 3. Tranzicija ka VLSI i FPGA
Sa razvojem silicijumske tehnologije (VLSI - Very Large Scale Integration) tokom 1980-ih i 1990-ih, fokus se prebacio na integrisana kola sa specificnom namjenom (ASIC) i programibilne logicke nizove (FPGA).
Sveobuhvatne naucne studije: Detaljan pregled tranzicije sa von Neumann-ove arhitekture na custom VLSI sisteme mozete pronaci u radu A Historical Survey of Algorithms and Hardware Architectures (ScienceDirect). [1]
Arhitekture i tehnike implementacije: Sveobuhvatni vodic kroz digitalne, analogne i hibridne sisteme pruza rad (PDF) A Survey of Neuromorphic Computing and Neural Networks in Hardware (ResearchGate), dok moderne aspekte optimizacije hardvera i potrosnje (od stotina vati do milivati) opisuje novija studija (PDF) Hardware Implementation of Neural Networks (ResearchGate). [1, 2] 4. Specijalizovana integrisana kola (AI ASICs / TPUs)
Moderna faza (Deep Learning era) donijela je potrebu za masivnim procesiranjem matricnog mnozenja (MAC operacije), sto je rezultiralo razvojem namjenskih akceleratora za duboko ucenje.
Teorijska osnova i mapiranje: Kako se matematicki modeli prebacuju na hardverske matrice otpornika i crossbar nizove, opisano je u radu Hardware-friendly Neural Network Architecture (arXiv). [1]
Tehnoloski vodici: Za dublje razumijevanje hardverskih ogranicenja i arhitekturalnih rjesenja (poput Google TPU, IBM ZISC ili CNAPS sistema), koristan izvor je i Hardware Implementation of Neural Network Using VHDL (IJECCE). [1] 5. Neuromorfni cipovi
Za razliku od klasicnih akceleratora, neuromorfni cipovi imitiraju bioloski rad mozga u realnom vremenu koristeci dogadajima vodenu (event-driven) obradu podataka i impulsne (Spiking) neuronske mreze (SNN).
Hardverski repozitorij i baza znanja: Otvorena platforma koja prati razvoj cipova kao sto su Intel Loihi, IBM TrueNorth, SpiNNaker i drugi, dostupna je u tehnickom vodicu Neuromorphic Hardware Guide - Open Neuromorphic. [1]
Repozitorij otvorenog koda: Ako vas zanimaju konkretni projekti i hardverski kod (VHDL/Verilog/SystemVerilog) za digitalne i asinkrone neuromorfne procesore, posjetite Awesome Neuromorphic HW (GitHub). [1]
Buduce tehnologije (Memristori i RRAM): Dokumentacija o naprednim tehnologijama pamcenja koje emuliraju sinapticke tezine na atomskom nivou opisana je u poglavlju Technology and Hardware for Neuromorphic Computing (River Publishers). [1]

https://en.wikipedia.org/wiki/History_of_artificial_neural_networks
https://galileo-unbound.blog/2025/02/05/a-short-history-of-neural-networks/
https://cs.stanford.edu/people/eroberts/courses/soco/projects/neural-networks/History/history1.html
https://www.sciencedirect.com/science/article/am/pii/S2212683X16300561
https://www.researchgate.net/publication/385988727_Hardware_Implementation_of_Neural_Networks
https://arxiv.org/html/1906.08853v1
https://ijecce.org/administrator/components/com_jresearch/files/publications/IJECCE_671_1_FInal.pdf
https://open-neuromorphic.org/neuromorphic-computing/hardware/
https://github.com/open-neuromorphic/awesome-neuromorphic-hw/blob/main/README.md
https://www.riverpublishers.com/downloadchapter.php?file=RP_9788770226103C2.pdf
```

</details>
