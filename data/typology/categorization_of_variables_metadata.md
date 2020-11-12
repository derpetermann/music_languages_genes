# Data Categorization

The table `categorization_of_variables.csv` categorizes variables according to their place in grammar. There are four columns representing a 2 x 2 approach:

- `Narrow_Phon_Definition.*` vs. `Broad_Phon_Definition.*_` refers to a narrow vs. broad definition of what counts as phonology, as explained below.
- `.*_Binary` vs. `*._Detailed` refers to a binary phonology vs grammar distinction vs. a 5-way classification

We use the following definitions:

- **Phonology:** This comes in two versions, a narrow and broad definition. Under the narrow definition, phonology captures really just the sound inventory and its properties, as well as stress and rhythm types. Phonology in this sense excludes everything related to phono- or morphotactics, syllable and word structure, rule domains, fusion etc. goes with grammar. Under the broad definition, phonology includes everything that has to do with sound patterns, i.e. including morphonology, word structure etc. 

- **Phonotactics:** syllable and other prosodic structure and constraints on where segments can occur based on such structure

- **Morphology:** everything that codes the overt marking of something and/or affects the structure of subphrasal domains: locus of marking, inflection, presence and kind of affixation, exponence, clitics, but it does not include the meaning of set up of markers (alignment, categories etc.). Morphology also includes WALS variables that code how some category is formally expressed (if it is expressed in 'words' at least in some cases. This is a murky area...)

- **Categories:** all information on the content of grammatical or semantic categories that are coded in the databases, also also all category or role groupings and splits (alignment etc.). Excludes statements about the sensitivity of constructions to categories, e.g. whether or not NPs are sensitive to alienability (which is considered part of syntax), or whether adjectives agree in gender

- **Syntax:** Constraints on constructions, scope regulations, unless the variables registers overt marking (in which case we coded it as morphology). Note that locus of marking is treated here as part of morphology (even when the marker is an adposition).

- **SyntaxOrder:** Word and constituent order

We also subtler distinctions within the phonology domain in the two columns:

- **Broad_Phon_Definition_Consonantal_Vocalic:** This column distinguishes the `Phonology` definition into `Consonantal` vs `Vocalic` features. Other aspects of phonology, e.g. prosody and phonotactics are untouched.

- **Broad_Phon_Definition_Prosodic_Segmental:** This column distinguishes the `Phonology` definition into `Prosodic` vs `Segmental` features. Prosodic features include intonation, tone, stress, and rhythm. Segmental indicates features at the level of segments. Phonotactic structures are not coded.

