# Preparing the environment, cleaning the data for Stacks


### 1. First, we will create a set of directories to place data in. At each step of the analysis, we will transform the data moving it from the `raw/` to `samples/` to `stacks/`.

```

~/tutorial% mkdir raw samples stacks
~/tutorial% ls
 raw/ samples/ stacks/

```

### 2. We will assume that you have placed the raw sequencing data into the `raw/` directory. If you are using the raw files output by the BUSTARD part of the pipeline your data will look like this 

```

~/tutorial/raw% ls 
s_1_1_0001_qseq.txt  s_1_1_0025_qseq.txt  s_1_1_0049_qseq.txt  s_1_1_0073_qseq.txt  s_1_1_0097_qseq.txt
s_1_1_0002_qseq.txt  s_1_1_0026_qseq.txt  s_1_1_0050_qseq.txt  s_1_1_0074_qseq.txt  s_1_1_0098_qseq.txt
s_1_1_0003_qseq.txt  s_1_1_0027_qseq.txt  s_1_1_0051_qseq.txt  s_1_1_0075_qseq.txt  s_1_1_0099_qseq.txt
s_1_1_0004_qseq.txt  s_1_1_0028_qseq.txt  s_1_1_0052_qseq.txt  s_1_1_0076_qseq.txt  s_1_1_0100_qseq.txt
s_1_1_0005_qseq.txt  s_1_1_0029_qseq.txt  s_1_1_0053_qseq.txt  s_1_1_0077_qseq.txt  s_1_1_0101_qseq.txt
s_1_1_0006_qseq.txt  s_1_1_0030_qseq.txt  s_1_1_0054_qseq.txt  s_1_1_0078_qseq.txt  s_1_1_0102_qseq.txt
s_1_1_0007_qseq.txt  s_1_1_0031_qseq.txt  s_1_1_0055_qseq.txt  s_1_1_0079_qseq.txt  s_1_1_0103_qseq.txt
s_1_1_0008_qseq.txt  s_1_1_0032_qseq.txt  s_1_1_0056_qseq.txt  s_1_1_0080_qseq.txt  s_1_1_0104_qseq.txt
s_1_1_0009_qseq.txt  s_1_1_0033_qseq.txt  s_1_1_0057_qseq.txt  s_1_1_0081_qseq.txt  s_1_1_0105_qseq.txt
s_1_1_0010_qseq.txt  s_1_1_0034_qseq.txt  s_1_1_0058_qseq.txt  s_1_1_0082_qseq.txt  s_1_1_0106_qseq.txt
s_1_1_0011_qseq.txt  s_1_1_0035_qseq.txt  s_1_1_0059_qseq.txt  s_1_1_0083_qseq.txt  s_1_1_0107_qseq.txt
s_1_1_0012_qseq.txt  s_1_1_0036_qseq.txt  s_1_1_0060_qseq.txt  s_1_1_0084_qseq.txt  s_1_1_0108_qseq.txt
s_1_1_0013_qseq.txt  s_1_1_0037_qseq.txt  s_1_1_0061_qseq.txt  s_1_1_0085_qseq.txt  s_1_1_0109_qseq.txt
s_1_1_0014_qseq.txt  s_1_1_0038_qseq.txt  s_1_1_0062_qseq.txt  s_1_1_0086_qseq.txt  s_1_1_0110_qseq.txt
s_1_1_0015_qseq.txt  s_1_1_0039_qseq.txt  s_1_1_0063_qseq.txt  s_1_1_0087_qseq.txt  s_1_1_0111_qseq.txt
s_1_1_0016_qseq.txt  s_1_1_0040_qseq.txt  s_1_1_0064_qseq.txt  s_1_1_0088_qseq.txt  s_1_1_0112_qseq.txt
s_1_1_0017_qseq.txt  s_1_1_0041_qseq.txt  s_1_1_0065_qseq.txt  s_1_1_0089_qseq.txt  s_1_1_0113_qseq.txt
s_1_1_0018_qseq.txt  s_1_1_0042_qseq.txt  s_1_1_0066_qseq.txt  s_1_1_0090_qseq.txt  s_1_1_0114_qseq.txt
s_1_1_0019_qseq.txt  s_1_1_0043_qseq.txt  s_1_1_0067_qseq.txt  s_1_1_0091_qseq.txt  s_1_1_0115_qseq.txt
s_1_1_0020_qseq.txt  s_1_1_0044_qseq.txt  s_1_1_0068_qseq.txt  s_1_1_0092_qseq.txt  s_1_1_0116_qseq.txt
s_1_1_0021_qseq.txt  s_1_1_0045_qseq.txt  s_1_1_0069_qseq.txt  s_1_1_0093_qseq.txt  s_1_1_0117_qseq.txt
s_1_1_0022_qseq.txt  s_1_1_0046_qseq.txt  s_1_1_0070_qseq.txt  s_1_1_0094_qseq.txt  s_1_1_0118_qseq.txt
s_1_1_0023_qseq.txt  s_1_1_0047_qseq.txt  s_1_1_0071_qseq.txt  s_1_1_0095_qseq.txt  s_1_1_0119_qseq.txt
s_1_1_0024_qseq.txt  s_1_1_0048_qseq.txt  s_1_1_0072_qseq.txt  s_1_1_0096_qseq.txt  s_1_1_0120_qseq.txt

```

If, instead, you are using the output of the GERALD part of the Illumina pipeline, your data will be a little simpler:

```

~/tutorial/raw% ls
s_1_sequence.txt

```

### 3. The next step is to create a file containing our five barcodes. Using a convenient editor, place the barcodes alone in a file, one per line.

```
~/tutorial% vi barcodes
~/tutorial% more barcodes 
CGATA
GAAGC
TGACC
AACCC
ACTGC

```

After the last two steps, our working directory should look like this:

```
~/tutorial% ls
barcodes  raw/  samples/  stacks/

````

