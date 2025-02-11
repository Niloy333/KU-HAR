# KU-HAR

Human Activity Recognition (HAR) refers to the capacity of machines to perceive human actions. This dataset contains information on 18 different activities collected from 90 participants (75 male and 15 female) using smartphone sensors (Accelerometer and Gyroscope). It has 1945 raw activity samples collected directly from the participants, and 20750 subsamples extracted from them. The activities are:

## Classes

Stand➞ Standing still (1 min)

Sit➞ Sitting still (1 min) 

Talk-sit➞ Talking with hand movements while sitting (1 min) 

Talk-stand➞ Talking with hand movements while standing or walking(1 min) 

Stand-sit➞ Repeatedly standing up and sitting down (5 times)

Lay➞ Laying still (1 min) 

Lay-stand➞ Repeatedly standing up and laying down (5 times)

Pick➞ Picking up an object from the floor (10 times)

Jump➞ Jumping repeatedly (10 times)

Push-up➞ Performing full push-ups (5 times)

Sit-up➞ Performing sit-ups (5 times)

Walk➞ Walking 20 meters (≈12 s)

Walk-backward➞ Walking backward for 20 meters (≈20 s)

Walk-circle➞ Walking along a circular path (≈ 20 s)

Run➞ Running 20 meters (≈7 s)

Stair-up➞ Ascending on a set of stairs (≈1 min)

Stair-down➞ Descending from a set of stairs (≈50 s)

Table-tennis➞ Playing table tennis (1 min)

## Access Dataset

The dataset can be accessed on [Mendeley Data](https://data.mendeley.com/datasets/45f952y38r/5) and [Kaggle](https://www.kaggle.com/datasets/niloy333/kuhar)

## Contents of the attached .zip files

1.Raw_time_domian_data.zip➞ Originally collected 1945 time-domain samples in separate .csv files. The arrangement of information in each .csv file is:
	Column 1, 5➞ exact time (elapsed since the start) when the Accelerometer & Gyro output was recorded (in ms)
	Col. 2, 3, 4➞ Acceleration along X,Y,Z axes (in m/s^2)
	Col. 6, 7, 8➞ Rate of rotation around X,Y,Z axes (in rad/s)

2.Trimmed_interpolated_raw_data.zip➞ Unnecessary parts of the samples were trimmed (only from the beginning and the end). The samples were interpolated to keep a constant sampling rate of 100 Hz. The arrangement of information is the same as above.

3.Time_domain_subsamples.zip➞ 20750 subsamples extracted from the 1945 collected samples provided in a single .csv file. Each of them contains 3 seconds of non-overlapping data of the corresponding activity. Arrangement of information:
	Col. 1–300, 301–600, 601–900➞ Acc.meter X, Y, Z axes readings
	Col. 901–1200, 1201–1500, 1501–1800➞ Gyro X, Y, Z axes readings
	Col. 1801➞ Class ID (0 to 17, in the order mentioned above)
	Col. 1802➞ length of the each channel data in the subsample
	Col. 1803➞ serial no. of the subsample

Gravity acceleration was omitted from the Acc.meter data, and no filter was applied to remove noise. The dataset is free to download, modify, and use. 

## Reference

N. Sikder and A.-A. Nahid, “KU-HAR: An open dataset for heterogeneous human activity recognition,” Pattern Recognition Letters, vol. 146. Elsevier BV, pp. 46–54, Jun. 2021. doi: 10.1016/j.patrec.2021.02.024. [Read paper](https://www.sciencedirect.com/science/article/pii/S0167865521000933) / [preprint](https://www.researchgate.net/publication/350136683_KU-HAR_An_open_dataset_for_heterogeneous_human_activity_recognition)

Backup: drive.google.com/drive/folders/1yrG8pwq3XMlyEGYMnM-8xnrd6js0oXA7
