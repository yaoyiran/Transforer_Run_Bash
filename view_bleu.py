f = open('train.nohup.out','r')
lines = f.readlines()
f.close()

valid = []
test = []
k = 0
for line in lines:
    if "valid on 'valid' subset" in line:
        k = 0
    if "valid on 'test' subset" in line:
        k = 1
    if "with beam=4" in line:
       if k == 0:
           valid.append(float(line.split()[7].strip(',')))
       if k == 1: 
           test.append(float(line.split()[7].strip(',')))
print("Validation Results")
print(list(enumerate(valid)))
print("Test Results")
print(list(enumerate(test)))
