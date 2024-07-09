const SCRIPT_PATH = 'php/main.php';

const filtersContainer = document.querySelector('.gallery__filter-list');
const filterTemplate = document.querySelector('#filter').content;
const filterItemTemplate = filterTemplate.querySelector('.gallery__filter-item');
const cardsContainer = document.querySelector('.gallery__list');
const cardTemplate = document.querySelector('#card').content;
const cardItemTemplate = cardTemplate.querySelector('.card');

const createFilterElement = ({ name, count }) => {
  const filterElement = filterItemTemplate.cloneNode(true);
  filterElement.querySelector('.gallery__filter-name').textContent = name;
  filterElement.querySelector('.gallery__filter-count').textContent = `(${count})`;
  return filterElement;
};

const setFiltersContainer = (categories) => {
  const filtersFragment = document.createDocumentFragment();
  categories.forEach(category => filtersFragment.appendChild(createFilterElement(category)));
  filtersContainer.appendChild(filtersFragment);
}

const createCardElement = ({ name, category, likes, comments }) => {
  const cardElement = cardItemTemplate.cloneNode(true);
  cardElement.querySelector('.card__title').textContent = name;
  cardElement.querySelector('.card__category').textContent = category;
  cardElement.querySelector('.card__likes').textContent = likes;
  cardElement.querySelector('.card__comments').textContent = comments;
  return cardElement;
};

const setCardsContainer = (works) => {
  const cardsFragment = document.createDocumentFragment();
  works.forEach((work) => cardsFragment.appendChild(createCardElement(work)));
  cardsContainer.appendChild(cardsFragment);
}

const loadData = async (url) => {
  try {
    const response = await fetch(url);
    return await response.json();
  } catch (error) {
    throw Error(error);
  }
}

const getData = async () => loadData(SCRIPT_PATH);

const main = async () => {
  try {
    const { categories, works } = await getData();
    setFiltersContainer(categories);
    setCardsContainer(works);
  } catch (error) {
    console.error('Ошибка при получении данных:', error);
  }
};

main();
