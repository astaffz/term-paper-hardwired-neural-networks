# Reading list: Ožičeno programiranje neuralnih mreža (PJP seminarski)

Made 2026-11-09 for the PJP seminarski (Ribić's 5 proposed chapters, see
`Fakultet/PJP/seminarski/references/professor-notes.md`). All links were checked on 2026-11-09.
The same list is kept in two places: `University/courses/programski-jezici-i-prevodioci/resources/`
and `Fakultet/PJP/seminarski/references/reading-list.md`.

**Brief.** Starting level: programming background, little knowledge of neural networks
or their hardware. Needed: intuition for the formal neuron and learning, then citable
sources per section: history (Mark I, ADALINE), VLSI/FPGA, AI ASIC/TPU, neuromorphic
chips and memristors.

**The thread through the whole paper:** a neuron computes a weighted sum of its
inputs, and the hardware's whole job is to do that multiply-and-add (MAC) fast and
cheaply. Each era stores the weights differently: motor-driven potentiometers →
memistors → digital registers → on-chip memory → memristors.

## Start here (about 3 evenings, in this order)

### 1. What a neural network is

1. **3Blue1Brown, _Neural networks_, chapters 1–2** —
   https://www.youtube.com/playlist?list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi
   — ~40 min, English. Best visual intro to neurons, weights and learning. Enough
   background for section 5.1.
2. **Michael Nielsen, _Neural Networks and Deep Learning_, chapter 1** —
   http://neuralnetworksanddeeplearning.com/ — free online book. Read perceptrons,
   sigmoid neurons, architecture; skip the code. Same material as the videos, in text
   you can paraphrase and cite.
3. **FER Zagreb, _Umjetne neuronske mreže_** (Dalbelo Bašić, Čupić, Šnajder; slides
   v4.7, 2011, 50 pp., Croatian) —
   https://www.fer.unizg.hr/_download/repository/UI_12_UmjetneNeuronskeMreze.pdf
   — use for **terminology in our language** (model neurona, perceptron, učenje,
   backpropagation, povijesni pregled).

### 2. The big picture

4. **Veritasium, _Future Computers Will Be Radically Different (Analog Computing)_**
   (2022) — https://www.youtube.com/watch?v=GVsUOuSjvcg — almost the whole paper as
   one story. Perceptron history from about 5:41, the digital deep-learning era, and
   analog AI chips from about 22:15 (timestamps from a third-party summary, may be off
   slightly). Watch all of it.
5. Then skim only the **introductions** of Ribić's two surveys (James 2017, Schuman
   2017; links in `references/professor-notes.md`) to get the map.

## Per section, while writing it

### 5.2 Historijski počeci

- **Cornell Chronicle, _Professor's perceptron paved the way for AI – 60 years too soon_**
  (2019) — https://news.cornell.edu/stories/2019/09/professors-perceptron-paved-way-ai-60-years-too-soon
  — short readable article on Rosenblatt and the Mark I.
- **Wikipedia, _Mark I Perceptron_** — https://en.wikipedia.org/wiki/Mark_I_Perceptron
  — facts and dates; follow its references.
- **Bernard Widrow, _The LMS algorithm and ADALINE. Part II – ADALINE and memistor ADALINE_**
  (channel widrowlms, 34:23, 2012) — https://www.youtube.com/watch?v=skfNlwEbqck
  — the inventor demonstrating the real machines, including the memistor ADALINE.
  Primary source; settles the electrochemical vs. electromechanical memistor question.
- **Widrow & Lehr (1990), _30 Years of Adaptive Neural Networks: Perceptron, Madaline,
  and Backpropagation_**, Proceedings of the IEEE —
  https://www-isl.stanford.edu/~widrow/papers/j199030years.pdf — history by the
  inventor; best citable source for 5.1 and 5.2.

### 5.3 Tranzicija ka VLSI i FPGA

- **Misra & Saha (2010), _Artificial neural networks in hardware: A survey of two
  decades of progress_**, Neurocomputing — free PDF:
  http://algos.inesc-id.pt/projectos/efiann/FCT/r05.pdf — analog, digital, hybrid and
  FPGA neural hardware, 1990–2010.
- Then Ribić's James 2017 and IJECCE papers.

### 5.4 AI ASIC i TPU

- **Google Cloud blog, _An in-depth look at Google's first Tensor Processing Unit (TPU)_** —
  https://cloud.google.com/blog/products/ai-machine-learning/an-in-depth-look-at-googles-first-tensor-processing-unit-tpu
  — read first for 5.4: animated systolic array (the grid of multiply-add units at the
  heart of the TPU), numbers on ops per cycle and performance per watt. Based on
  Google's 2017 TPU paper (Jouppi et al.).
- **Sze, Chen, Yang, Emer (2017), _Efficient Processing of Deep Neural Networks: A
  Tutorial and Survey_** — https://arxiv.org/abs/1703.09039 — the standard tutorial on
  DNN hardware; read the overview and hardware sections only.

### 5.5 Neuromorfni čipovi

- **Intel Technology, _Architecture All Access: Neuromorphic Computing Part 1_**
  (~10 min) — https://www.youtube.com/watch?v=6Dcs6fQglRA — gentlest intro to spiking
  networks and Loihi.
- **Anastasi In Tech, _Intel Advances in AI: Brain-Like Computing and Spiking Neural
  Networks Explained_** (15 min, 2022) — https://www.youtube.com/watch?v=GY69IuTLmkk
  — neuromorphic computing and spikes; analog chips and electrochemical RAM near the
  end (useful for the memristor subsection).
- **Carver Mead (1990), _Neuromorphic electronic systems_**, Proceedings of the IEEE
  78, pp. 1629–1636 — https://hasler.ece.gatech.edu/Published_papers/Technology_overview/MeadNeuro1990.pdf
  — the paper that coined "neuromorphic"; short, cite it in the section opening.
- **Memristors and RRAM: Ielmini & Wong (2018), _In-memory computing with resistive
  switching devices_**, Nature Electronics 1, pp. 333–343 —
  https://www.nature.com/articles/s41928-018-0092-2 — paywalled, try the faculty's
  access; otherwise Ribić's River Publishers chapter covers the same ground.

## How to read without drowning

- Don't read surveys cover to cover: the introduction plus the part for the section
  you're writing, then write that section while it's fresh.
- Add a `\bibitem` in `sections/bibliografija.tex` the moment you use a source.
- Not needed: backpropagation derivations or spiking-neuron equations. The chapter is
  about how networks were built in hardware, not training theory.
