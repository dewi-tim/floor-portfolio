document.addEventListener('DOMContentLoaded', function() {
    // Fetch the menu data with cache-busting
    fetch('data.json?v=' + new Date().getTime())
        .then(response => response.json())
        .then(data => {
            renderMenuItems(data.items);
            setupEventListeners();
        })
        .catch(error => console.error('Error loading menu data:', error));
});

function renderMenuItems(items) {
    const menuGrid = document.getElementById('menu-grid');
    menuGrid.innerHTML = ''; // Clear grid first
    const timestamp = new Date().getTime();
    
    // Create items directly in the grid
    items.forEach(item => {
        const menuItem = document.createElement('div');
        menuItem.className = 'menu-item';
        menuItem.dataset.id = item.id;
        
        // Create elements for each part
        const title = document.createElement('h3');
        title.className = 'item-title';
        title.textContent = item.title;
        
        const thumbnailContainer = document.createElement('div');
        thumbnailContainer.className = 'thumbnail-container';
        
        const thumbnail = document.createElement('img');
        thumbnail.className = 'thumbnail';
        thumbnail.src = `${item.thumbnail}?v=${timestamp}`;
        thumbnail.alt = item.title;
        thumbnail.loading = 'lazy';
        
        const description = document.createElement('p');
        description.className = 'item-description';
        description.textContent = item.shortDescription;
        
        // Assemble the menu item
        thumbnailContainer.appendChild(thumbnail);
        menuItem.appendChild(title);
        menuItem.appendChild(thumbnailContainer);
        menuItem.appendChild(description);
        
        menuGrid.appendChild(menuItem);
    });
}

function setupEventListeners() {
    // Setup click event for menu items - using event delegation
    const menuGrid = document.getElementById('menu-grid');
    const modal = document.getElementById('modal');
    const closeButton = document.getElementById('close-button');
    
    menuGrid.addEventListener('click', function(event) {
        // Find the closest menu-item parent of the clicked element
        const menuItem = event.target.closest('.menu-item');
        if (menuItem) {
            const itemId = parseInt(menuItem.dataset.id);
            openModal(itemId);
        }
    });
    
    // Setup close button for modal
    closeButton.addEventListener('click', closeModal);
    
    // Close modal when clicking/tapping outside of modal content
    window.addEventListener('click', function(event) {
        if (event.target === modal) {
            closeModal();
        }
    });
    
    // Add touchend event for mobile devices
    window.addEventListener('touchend', function(event) {
        if (event.target === modal) {
            closeModal();
        }
    });
    
    // Close modal with escape key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeModal();
        }
    });
}

function openModal(itemId) {
    fetch('data.json?v=' + new Date().getTime())
        .then(response => response.json())
        .then(data => {
            const item = data.items.find(i => i.id === itemId);
            
            if (item) {
                // Prepare content before showing modal
                document.getElementById('modal-title').textContent = item.title;
                
                // Load image
                const modalImage = document.getElementById('modal-image');
                modalImage.src = item.image + '?v=' + new Date().getTime();
                modalImage.alt = item.title;
                
                // Show the description element
                const descriptionElement = document.getElementById('modal-description');
                
                // Simple approach: replace \n with <br> tags
                const formattedText = item.fullDescription.replace(/\n/g, '<br>');
                descriptionElement.innerHTML = formattedText;
                
                // Show modal
                const modal = document.getElementById('modal');
                modal.style.display = 'block';
                
                // Prevent scrolling behind modal
                document.body.style.overflow = 'hidden';
                
                // Focus the modal content for accessibility
                setTimeout(() => {
                    document.getElementById('modal-title').focus();
                }, 100);
            }
        })
        .catch(error => console.error('Error loading item details:', error));
}

function closeModal() {
    document.getElementById('modal').style.display = 'none';
    document.body.style.overflow = ''; // Restore scrolling
}

// Add placeholder images for development
function createPlaceholderImages() {
    // This function would be removed in production
    // It's just for development without actual images
    console.log('Creating placeholder images for development...');
    
    // For a real implementation, you would remove this function
    // and provide actual images named pastry1.png through pastry8.png
    // and pastry1-thumb.png through pastry8-thumb.png
}