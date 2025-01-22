document.addEventListener('DOMContentLoaded', () => {
  const skillsSection = document.querySelector('#section-skills');

  const observerOptions = {
    root: null,
    threshold: 0.5,
  };

  const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add('in-view');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  if (skillsSection) {
    observer.observe(skillsSection);
  }
});
