import Bio
from Bio.Seq import Seq

#define my variable
my_dna = Seq("AGTACACTGGTT")

my_dna.complement()


# transcribe function used to convert DNA to RNA and vice versa
my_rna = my_dna.transcribe()
my_rna
my_rna.complement_rna()
my_dna_from_rna = my_rna.back_transcribe()
my_dna_from_rna 

my_dna == my_dna_from_rna


## reading in files (fasta, genbank, etc)
from Bio import SeqIO

record_iterator = SeqIO.parse("ls_orchid.gbk", "genbank")
first_record = next(record_iterator)
first_record.annotations
first_record.id
first_record.name
first_record.description
first_record.dbxrefs

#### Online databases ####

from Bio import Entrez
Entrez.email = "vb24072@bristol.ac.uk"
handle = Entrez.einfo()
result = Entrez.read(handle)
print(result["DbList"])