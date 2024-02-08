import "./mediaGalleryDesktop.css";
import { useEffect, useState } from "react";
import axios from "axios";

const MediaGalleryDesktop = ({
  currentProduct,
  toggleModal,
  // toggleReviewsActive,
  // isReviewsActive,
  scrollToPanel,
}) => {
  const [mainImage, setMainImage] = useState("");
  const [images, setImages] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(`/api/img_urls/${currentProduct.id}`);
        console.log("Image-url table", response.data);
        if (response.data.length > 0) {
          const imagesData = response.data.map((image) => ({
            original: `https://images.thdstatic.com/productImages/${image.img_url}600.jpg`,
            thumbnail: `https://images.thdstatic.com/productImages/${image.img_url}100.jpg`,
            id: `image${image.id}`,
          }));
          setImages(imagesData);
          setMainImage(imagesData[0].original);
        }
      } catch (error) {
        console.error("Error fetching image-urls for modal", error);
      }
    };
    fetchData();
  }, [currentProduct]);

  const showThumbnails = () => {
    const visibleThumbnails = images.slice(0, 5); // limit to 6
    const remainingThumbnailsCount = images.length - visibleThumbnails.length;

    return (
      <>
        {visibleThumbnails.map((image) => (
          <button
            key={image.id}
            className="btn-thumbnail"
            onMouseEnter={() => handleThumbnailHover(image)}
          >
            <img
              src={image.thumbnail}
              className="thumbnail-image"
              alt={`Thumbnail ${image.id}`}
            />
          </button>
        ))}
        {remainingThumbnailsCount > 0 && (
          <div className="btn-thumbnail" onClick={toggleModal}>
            <img
              src={visibleThumbnails[visibleThumbnails.length - 1].thumbnail}
              className="thumbnail-image"
              alt={`Thumbnail ${
                visibleThumbnails[visibleThumbnails.length - 1].id
              }`}
            />
            <div className="thumbnail-overlay">
              <span className="gallery-overlay-text">
                +{remainingThumbnailsCount}
              </span>
            </div>
          </div>
        )}
      </>
    );
  };

  const handleClick = () => {
    toggleModal();
  };

  const handleThumbnailHover = (thumbnail) => {
    setMainImage(thumbnail.original);
  };

  const handleReviewsClick = () => {
    // toggleReviewsActive();
    scrollToPanel(3);
  };

  const handleQuestionsClick = () => {
    scrollToPanel(2);
  };

  return (
    <>
      <div className="gallery-container">
        <div className="gallery-header">
          <div className="gallery-best-seller">BEST SELLER</div>
          <div className="gallery-manufacturer">
            {currentProduct.manufacturer}
          </div>
          <div className="gallery-item-title">
            {currentProduct.product_name}
          </div>
          <div className="gallery-review-questions-container">
            <div
              className="gallery-review-summary"
              onClick={handleReviewsClick}
            >
              ⭐️⭐️⭐️⭐️⭐️ (15) Reviews Summary
            </div>
            <div
              className="gallery-questions-summary"
              onClick={handleQuestionsClick}
            >
              Questions & Answers (15)
            </div>
          </div>
        </div>
        <div className="gallery-photos-container">
          <div className="gallery-thumbnail-column-container">
            {showThumbnails()}
          </div>
          <div className="gallery-main-image">
            <img src={mainImage} alt="Main Image" onClick={handleClick} />
          </div>
        </div>
      </div>
    </>
  );
};

export default MediaGalleryDesktop;
