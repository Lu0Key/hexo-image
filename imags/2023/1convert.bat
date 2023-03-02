del .\convert_MNIST\t10k-labels-idx1-ubyte
del .\convert_MNIST\t10k-images-idx3-ubyte
del .\convert_MNIST\train-labels-idx1-ubyte
del .\convert_MNIST\train-images-idx3-ubyte
del .\convert_MNIST\t10k-labels-idx1-ubyte.gz
del .\convert_MNIST\t10k-images-idx3-ubyte.gz
del .\convert_MNIST\train-labels-idx1-ubyte.gz
del .\convert_MNIST\train-images-idx3-ubyte.gz

del .\convert_MNIST\non_noise_data /q
mkdir .\convert_MNIST\non_noise_data

python .\convert_to_mnist_format.py data_prepare/generateImg_datasets/train train
python .\convert_to_mnist_format.py data_prepare/generateImg_datasets/test test

gzip .\convert_MNIST\t10k-labels-idx1-ubyte
gzip .\convert_MNIST\t10k-images-idx3-ubyte
gzip .\convert_MNIST\train-labels-idx1-ubyte
gzip .\convert_MNIST\train-images-idx3-ubyte

move .\convert_MNIST\t10k-labels-idx1-ubyte.gz .\convert_MNIST\non_noise_data
move .\convert_MNIST\t10k-images-idx3-ubyte.gz .\convert_MNIST\non_noise_data
move .\convert_MNIST\train-labels-idx1-ubyte.gz .\convert_MNIST\non_noise_data
move .\convert_MNIST\train-images-idx3-ubyte.gz .\convert_MNIST\non_noise_data

python .\convert_to_mnist_format.py data_prepare/generateImg_datasets_noise/train train
python .\convert_to_mnist_format.py data_prepare/generateImg_datasets_noise/test test

gzip .\convert_MNIST\t10k-labels-idx1-ubyte
gzip .\convert_MNIST\t10k-images-idx3-ubyte
gzip .\convert_MNIST\train-labels-idx1-ubyte
gzip .\convert_MNIST\train-images-idx3-ubyte

python .\convert_to_mnist_format.py data_prepare/generateImg_datasets_noise/train train
python .\convert_to_mnist_format.py data_prepare/generateImg_datasets_noise/test test
