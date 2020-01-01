SRC = $(wildcard nbs/*.ipynb)

all: python_algorithm_problems docs

python_algorithm_problems: $(SRC)
	nbdev_build_lib
	touch python_algorithm_problems

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

pypi: dist
	twine upload --repository pypi dist/*

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist