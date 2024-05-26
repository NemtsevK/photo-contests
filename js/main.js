const SCRIPT_PATH = 'php/main.php';

const filtersContainer = document.querySelector('.gallery__filter-list');
const filterTemplate = document.querySelector('#filter').content;
const filterItem = filterTemplate.querySelector('.gallery__filter-item');
const cardsContainer = document.querySelector('.gallery__list');
const cardTemplate = document.querySelector('#card').content;
const card = cardTemplate.querySelector('.card');

const setFiltersContainer = (categories) => {
  const filtersFragment = document.createDocumentFragment();
  categories.forEach(({ name, count }) => {
    const filterElement = filterItem.cloneNode(true);
    filterElement.querySelector('.gallery__filter-name').textContent = name;
    filterElement.querySelector('.gallery__filter-count').textContent = `(${count})`;
    filtersFragment.appendChild(filterElement);
  });
  filtersContainer.appendChild(filtersFragment);
}

const setCardsContainer = (works) => {
  const cardsFragment = document.createDocumentFragment();
  works.forEach(({ name, category, likes, comments }) => {
    const cardElement = card.cloneNode(true);
    cardElement.querySelector('.card__title').textContent = name;
    cardElement.querySelector('.card__category').textContent = category;
    cardElement.querySelector('.card__likes').textContent = likes;
    cardElement.querySelector('.card__comments').textContent = comments;
    cardsFragment.appendChild(cardElement);
  });
  cardsContainer.appendChild(cardsFragment);
}

const getData = () =>
  fetch(SCRIPT_PATH)
    .then((response) => response.json())
    .catch(error => console.error('Ошибка:', error));

getData()
  .then(data => {
    const { categories, works } = data
    setFiltersContainer(categories);
    setCardsContainer(works);
  })
