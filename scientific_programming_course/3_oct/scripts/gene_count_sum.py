gene_file = open("gene_counts.csv")
gene_out = open("gene_counts_sum.csv", "w")
gene_out.write("#Gene,p53vsGFP,wtvsGFP,Sum\n") # Write header

for line in gene_file:
    if not line.startswith("#"):
        row = line.strip("\n").split(",")
        # Add a new column with the sum of the counts
        new_c = int(row[1]) + int(row[2])
        row.append(str(new_c)) # Convert to string for writing
        new_line = ",".join(row) + "\n" # Add the separator and newline
        gene_out.write(new_line)

gene_file.close()
gene_out.close()