const toggleMenu = () => {
    const menuToggle = document.querySelector('.toggle');
    const navigation = document.querySelector('.navigation');
    if (menuToggle) {
    menuToggle.classList.toggle('active')
    }
    if (navigation) {
      navigation.classList.toggle('active')
    }
}
  export { toggleMenu }
