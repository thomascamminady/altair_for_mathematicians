init:
	code .
	poetry config --local virtualenvs.create true
	poetry config --local virtualenvs.in-project true
	poetry env use 3.10
	poetry install
	poetry update
	git init
	echo ".venv/" >> .gitignore
	echo "logs/" >> .gitignore
	git lfs install
	git lfs track "*.fit"
	git lfs track "*.hdf5"
	git lfs track "*.html"
	git lfs track "*.parquet"
	git add .
	poetry run pre-commit run --all-files
	git commit -am "Initial commit after initializing the project."
	poetry shell

test:
	pytest .

coverage:
	pytest --cov=altair_for_mathematicians tests/


book:
	poetry run jupyter-book clean altair_for_mathematicians
	poetry run jupyter-book build altair_for_mathematicians
	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome file:///Users/thomascamminady/Playground/altair_for_mathematicians/altair_for_mathematicians/_build/html/index.html
