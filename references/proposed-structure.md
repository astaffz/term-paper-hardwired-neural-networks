# Proposed structure: Ožičeno programiranje neuralnih mreža (PJP seminarski)

## Revised outline at a glance

Italic items are new, moved or merged.

- **5.1** Model formalnog neurona · Aktivacijske funkcije · Učenje: perceptron i LMS · Višeslojne mreže · MAC · _Učenje i izvođenje_
- **5.2** Mark I · ADALINE i MADALINE · _Kraj prvog talasa_
- **5.3** Von Neumann → VLSI · Digitalne/analogne/hibridne · _Neuročipovi 1990-ih_ · FPGA
- **5.4** _GPU_ · Matrično množenje · Google TPU · _Analogno računanje u memoriji_ · _Ograničenja i optimizacije_
- **5.5** SNN · TrueNorth/Loihi/SpiNNaker · _Programiranje neuromorfnog hardvera_ · Memristori i RRAM
- **+** _Poređenje generacija_; optional 06 Veza s programskim jezicima

## Uvod (00): Keep

- `oziceni.tex` already has one paragraph on this topic. Pick it up and state the test
  above, so the reader knows why the chapter goes history → chips → neuromorphic.

## 5.1 Formalni neuron i principi neuralnih mreža

This section only sets up vocabulary, so keep it to 2–3 pages.

**5.1.1 Model formalnog neurona: Keep**

- Every later section builds hardware for this one formula: weighted sum plus threshold.
- McCulloch & Pitts (1943) showed that threshold neurons compute logic functions, so a
  network of them is a circuit. That links neatly to the TTL chapter right before this one.
- Sources: McCulloch & Pitts 1943; Nielsen ch. 1★; FER slides★ for terminology.

**5.1.2 Aktivacijske funkcije: Keep, short (or fold into 5.1.1)**

- In hardware the activation function is a circuit with a cost. A step is a comparator,
  a sigmoid needs an approximation (lookup table or piecewise-linear), and ReLU is almost
  free. That explains design choices described later.
- Sources: Tommiska 2003 (sigmoid on FPGAs); Nielsen ch. 1★.

**5.1.3 Perceptron i pravilo učenja: Keep, rename to "Učenje: pravilo perceptrona i LMS"**

- Learning means changing the weights, which means changing the program. Mark I and
  ADALINE built exactly these two rules in hardware, with motors and memistors, so 5.2
  needs both defined here.
- Sources: Rosenblatt 1958; Widrow & Lehr 1990★.

**5.1.4 Višeslojne mreže: Keep, short**

- It does two jobs. A single layer can't learn XOR, which sets up Minsky & Papert in 5.2.
  And a layer is a matrix–vector product, which sets up 5.1.5 and 5.4.
- Backpropagation gets one paragraph, no derivation.
- Sources: Minsky & Papert 1969; Rumelhart, Hinton & Williams 1986; Widrow & Lehr 1990★
  (MADALINE was an early multilayer network).

**5.1.5 Operacija MAC: Keep (the most important subsection)**

- It's the thread of the whole paper. A neuron with n inputs needs n multiply-accumulates
  (MACs), and a layer is W·x. Every later chip is a way to do more MACs per joule.
- Sources: Sze et al. 2017★; Google TPU blog★.

**5.1.6 Učenje i izvođenje (training vs. inference): Add**

- Most hardware in the chapter only runs a network trained somewhere else. TPU v1 only
  runs trained networks, and TrueNorth's networks are trained offline.
- Loading the trained weights onto the chip is literally the "programming" step. That's
  the clearest link to the title and to PJP.
- Sources: Jouppi et al. 2017; Merolla et al. 2014.

## 5.2 Historijski počeci

**5.2.1 Mark I Perceptron: Keep**

- The first hardware neural network (1958) and the most literal case of wired
  programming in this topic:
  - three layers: sensory → association → response
  - random connections from the sensory to the association layer, fixed in hardware
  - weights stored as motor-driven potentiometers
- A concrete result to quote: 99.8% accuracy telling squares from circles, after
  training on 10,000 images.
- Not settled yet: exactly how the random connections were physically wired. Check
  Rosenblatt 1960 or the Mark I operator's manual.
- Sources: Rosenblatt 1957 (Cornell report), 1958 and 1960; Wikipedia *Mark I Perceptron*★;
  Cornell Chronicle★.

**5.2.2 ADALINE i MADALINE: Keep**

- A second, different hardware answer: weights stored in electrochemical memistors.
  Widrow's own 1960 report is titled "…using **chemical** memistors", which corrects
  Ribić's "electromechanical". MADALINE was early multilayer hardware.
- The memistor is the ancestor of the memristor in 5.5.4, which gives the chapter a neat
  bookend.
- Sources: Widrow 1960 report; Widrow & Lehr 1990★; Widrow video Part II★.

**5.2.3 Kraj prvog talasa: Minsky i Papert (1969): Add**

- Without it, the history jumps from 1962 to the 1980s with no explanation.
- Their proof of what a single layer can't do is why hardware neural network research
  stalled. Multilayer networks and backpropagation (1986) are why it came back.
- Sources: Minsky & Papert 1969; Widrow & Lehr 1990★; Veritasium video★ (about 5:41–13:34).

## 5.3 Tranzicija ka VLSI i FPGA

**5.3.1 Od von Neumannove arhitekture ka VLSI: Keep**

- States the problem the rest of the chapter answers. A von Neumann machine keeps memory
  and compute separate, while a neural network touches every weight on every input. That
  mismatch is the "von Neumann bottleneck".
- Sources: James 2017★; Mead 1990★; Merolla 2014 (its Fig. 1 explains the bottleneck well).

**5.3.2 Digitalne, analogne i hibridne realizacije: Keep (the classification)**

- The field's standard classification. In terms of the thread: analog chips store a
  weight as charge or conductance, digital chips store it as bits.
- Sources: Misra & Saha 2010★; Schuman 2017★.

**5.3.3 Neuročipovi 1990-ih: ETANN, CNAPS, ZISC: Change (move here from 5.4)**

- These are 1990s chips, so in 5.4 they'd break the chronology. One analog and two
  digital examples make 5.3.2 concrete:
  - **Intel 80170 ETANN (1989):** 64 analog neurons, 10,240 floating-gate synapses
  - **CNAPS (Adaptive Solutions):** 64 processors per chip, each with 4 KB of local memory
  - **IBM ZISC036:** 36 neurons with up to 64 inputs, implementing a radial-basis-function network
- Sources: Holler et al. 1989; Computer History Museum blog (2024); CNAPS paper
  (NeurIPS 1990); ZISC036 paper; SIGARCH blog (2018).

**5.3.4 Realizacija neurona na FPGA: Keep**

- An FPGA is rewiring done in silicon: the configuration file (the bitstream) is the wiring.
- It links straight to the Verilog and VHDL chapters that follow this one, and a short
  VHDL listing makes the chapter fit a programming-languages encyclopedia.
- Today, tools like hls4ml compile a trained network directly into FPGA logic. CERN uses
  this for inference in under a microsecond.
- Sources: IJECCE★; Tommiska 2003; Duarte et al. 2018 (hls4ml).

**5.3.5 Optimizacija hardvera i potrošnje: Change (merge into 5.4.5)**

- Covers the same ground as "Hardverska ograničenja": precision, memory and power. One
  subsection avoids saying it twice.

## 5.4 Specijalizovana integrisana kola (AI ASIC i TPU)

**5.4.1 GPU kao prvi masovni akcelerator: Add**

- Deep learning took off on GPUs; AlexNet was trained on two of them in 2012.
- Without this, the jump from 1990s neurochips to the TPU has no motivation. Custom chips
  (ASICs) exist because GPUs aren't specialized enough.
- Sources: Krizhevsky et al. 2012; Sze 2017★; Veritasium★ (about 16:52).

**5.4.2 Matrično množenje i MAC operacije: Keep, but don't repeat 5.1.5**

- Focus on why ordinary processors struggle. Matrix multiplication is limited by
  computation, not memory, so the hardware wins by reusing each loaded value many times
  instead of fetching it again.
- Sources: Kung 1982; Sze 2017★.

**5.4.3 Google TPU: Keep, but change its source**

- The standard example of an AI chip:
  - a 256×256 systolic array, i.e. a grid of 65,536 units each doing an 8-bit
    multiply-add every cycle
  - 92 trillion operations per second at 700 MHz
  - about 83× better performance per watt than CPUs of the time
- The systolic array idea comes from Kung (1982), so this is a 1980s idea that waited
  35 years.
- The skeleton cites IJECCE here. Use Jouppi 2017 and the Google blog instead.
- Sources: Jouppi et al. 2017; Google blog★; Kung 1982.

**5.4.4 Analogno računanje u memoriji (crossbar nizovi): Change (rename of "Preslikavanje modela na crossbar nizove")**

- In a crossbar of resistors, Ohm's law does the multiplications and Kirchhoff's current
  law adds them up. The whole W·x happens in one step, with the weights stored as
  conductances.
- That's the Mark I idea back in silicon, and the strongest "full circle" point in the paper.
- Sources: Ielmini & Wong 2018★; Gopalakrishnan 2019★; Veritasium★ (from about 22:15).

**5.4.5 Ograničenja i optimizacije: Change (merge old 5.3.4 and 5.4.5)**

- One place for the trade-offs: precision (TPU v1 uses 8-bit integers), memory bandwidth
  and power.
- Sources: Sze 2017★; Jouppi 2017; hwimpl★.

## 5.5 Neuromorfni čipovi

**5.5.1 Obrada vođena događajima i SNN: Keep**

- Spiking networks use a different neuron model built on timing and spikes, called the
  "third generation" of neural networks. It explains the energy claim: power is spent
  only when a spike happens.
- Sources: Maass 1997; Mead 1990★; Intel video★.

**5.5.2 TrueNorth, Loihi, SpiNNaker: Keep**

- Three different designs, not three versions of the same one:
  - **TrueNorth (IBM, 2014):** digital, 1 million neurons, 256 million synapses, 63 mW
    while processing live video; networks trained offline
  - **Loihi (Intel, 2018):** learns on the chip itself; 14 nm process
  - **SpiNNaker (Manchester):** many ARM processor cores that simulate neurons in
    software, in real time
- Sources: Merolla et al. 2014; Davies et al. 2018 (free PDF); Furber et al. 2014;
  Open Neuromorphic guide★.

**5.5.3 Programiranje neuromorfnog hardvera: Change (replaces "Otvoreni hardverski projekti")**

- A GitHub list isn't a topic, but how these chips are programmed is, and it's the PJP angle:
  - **Lava:** Intel's Python framework for Loihi (its GitHub repository is now archived)
  - **PyNN:** one Python description of a network that runs on several simulators and on hardware
  - the HDL code collected in the Awesome Neuromorphic HW list
- Sources: Lava documentation; Davison et al. 2009 (PyNN); awesomehw★.

**5.5.4 Memristori i RRAM: Keep**

- The bookend. The line runs from Widrow's memistor (1960), to Chua's theoretical
  memristor (1971), to HP's titanium-dioxide device (2008), to today's RRAM crossbars.
  The weight is a resistance again.
- Add one sentence noting that the 2008 claim of finding the memristor is disputed. It
  keeps the text precise.
- Sources: Chua 1971; Strukov et al. 2008; Ielmini & Wong 2018★; River chapter★;
  Scientific Reports critique (2015).

## Additions for the chapter as a whole

**06 Veza s programskim jezicima (optional): now has material**

- If Ribić approves it, there's enough for 2–3 pages: hls4ml (network → FPGA), Lava and
  PyNN (Python as a language for describing networks), and the VHDL listing.

## New sources

| Source                                                                                                                                            | Used in             | Link                                                                                                                                          |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| McCulloch & Pitts (1943), _A logical calculus of the ideas immanent in nervous activity_, Bull. Math. Biophysics 5(4)                             | 5.1.1               | https://www.cs.cmu.edu/~./epxing/Class/10715/reading/McCulloch.and.Pitts.pdf                                                                  |
| Rosenblatt (1957), _The Perceptron — a perceiving and recognizing automaton_, Cornell Aeronautical Lab report                                     | 5.2.1               | https://bpb-us-e2.wpmucdn.com/websites.umass.edu/dist/a/27637/files/2016/03/rosenblatt-1957.pdf (linked from Wikipedia, not opened)           |
| Rosenblatt (1958), _The perceptron: a probabilistic model for information storage and organization in the brain_, Psychological Review 65(6)      | 5.1.3, 5.2.1        | https://pubmed.ncbi.nlm.nih.gov/13602029/                                                                                                     |
| Rosenblatt (1960), _Perceptron Simulation Experiments_, Proc. IRE 48(3)                                                                           | 5.2.1               | DOI 10.1109/JRPROC.1960.287598                                                                                                                |
| Widrow (1960), _An adaptive "Adaline" neuron using chemical memistors_, Stanford Electronics Labs report                                          | 5.2.2               | no free link found                                                                                                                            |
| Minsky & Papert (1969), _Perceptrons: An Introduction to Computational Geometry_, MIT Press                                                       | 5.1.4, 5.2.3        | book; overview: https://en.wikipedia.org/wiki/Perceptrons_(book)                                                                              |
| Rumelhart, Hinton & Williams (1986), _Learning representations by back-propagating errors_, Nature 323                                            | 5.1.4               | not checked online                                                                                                                            |
| Tommiska (2003), _Efficient digital implementation of the sigmoid function for reprogrammable logic_, IEE Proc.                                   | 5.1.2, 5.3.4        | https://aaltodoc.aalto.fi/bitstreams/1bf72883-e059-4358-8d45-ece202df2db6/download                                                            |
| Holler et al. (1989), _An electrically trainable artificial neural network (ETANN) with 10240 "floating gate" synapses_, IJCNN                    | 5.3.3               | https://www.semanticscholar.org/paper/An-electrically-trainable-artificial-neural-network-Holler-Tam/8941022cbbb4f99e878d5e342269f067f8596a77 |
| Computer History Museum (2024), _Neural Network Chip Joins the Collection_                                                                        | 5.3.3               | https://computerhistory.org/blog/neural-network-chip-joins-the-collection/                                                                    |
| _Back Propagation Implementation on the Adaptive Solutions CNAPS Neurocomputer Chip_, NeurIPS 1990                                                | 5.3.3               | https://papers.neurips.cc/paper_files/paper/1990/file/beed13602b9b0e6ecb5b568ff5058f07-Paper.pdf                                              |
| _Experience with the IBM ZISC036 neural network chip_                                                                                             | 5.3.3               | https://inspirehep.net/literature/407309                                                                                                      |
| R. Das (2018), _Neurochips from the 90s_, SIGARCH                                                                                                 | 5.3.3               | https://www.sigarch.org/neurochips-from-the-90s/                                                                                              |
| Duarte et al. (2018), _Fast inference of deep neural networks in FPGAs for particle physics_ (hls4ml), JINST 13                                   | 5.3.4, 06           | https://arxiv.org/abs/1804.06913                                                                                                              |
| Krizhevsky, Sutskever & Hinton (2012), _ImageNet Classification with Deep Convolutional Neural Networks_ (AlexNet)                                | 5.4.1               | https://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks                                             |
| H. T. Kung (1982), _Why Systolic Architectures?_, IEEE Computer 15(1)                                                                             | 5.4.2, 5.4.3        | https://www.eecs.harvard.edu/~htk/publication/1982-kung-why-systolic-architecture.pdf                                                         |
| Jouppi et al. (2017), _In-Datacenter Performance Analysis of a Tensor Processing Unit_                                                            | 5.1.6, 5.4.3, 5.4.5 | https://arxiv.org/abs/1704.04760                                                                                                              |
| Maass (1997), _Networks of spiking neurons: the third generation of neural network models_, Neural Networks (volume/issue not checked)            | 5.5.1               | https://igi-web.tugraz.at/PDF/85a.pdf                                                                                                         |
| Merolla et al. (2014), _A million spiking-neuron integrated circuit with a scalable communication network and interface_ (TrueNorth), Science 345 | 5.1.6, 5.3.1, 5.5.2 | https://www.science.org/doi/10.1126/science.1254642                                                                                           |
| Davies et al. (2018), _Loihi: A Neuromorphic Manycore Processor with On-Chip Learning_, IEEE Micro                                                | 5.5.2               | https://redwood.berkeley.edu/wp-content/uploads/2021/08/Davies2018.pdf                                                                        |
| Furber et al. (2014), _The SpiNNaker Project_, Proc. IEEE 102(5)                                                                                  | 5.5.2               | https://ieeexplore.ieee.org/document/6750072/                                                                                                 |
| Davison et al. (2009), _PyNN: a common interface for neuronal network simulators_, Frontiers in Neuroinformatics                                  | 5.5.3, 06           | https://www.frontiersin.org/journals/neuroinformatics/articles/10.3389/neuro.11.011.2008/full                                                 |
| Lava, Intel's software framework for neuromorphic computing                                                                                       | 5.5.3, 06           | https://lava-nc.org/                                                                                                                          |
| Chua (1971), _Memristor — the missing circuit element_, IEEE Trans. Circuit Theory 18                                                             | 5.5.4               | no free link found                                                                                                                            |
| Strukov et al. (2008), _The missing memristor found_, Nature 453                                                                                  | 5.5.4               | https://web.ece.ucsb.edu/~strukov/papers/2008/Nature2008.pdf                                                                                  |
| _The Missing Memristor has Not been Found_, Scientific Reports (2015)                                                                             | 5.5.4               | https://www.nature.com/articles/srep11657                                                                                                     |
