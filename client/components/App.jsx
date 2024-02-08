import React, { useEffect, useState } from "react";
import Sidebar from "./SidebarJSX/Sidebar.jsx";
import Header from "./Header/Header.jsx";
import MediaGalleryDesktop from "./MediaGallery/MediaGalleryDesktop.jsx";
import axios from "axios";
import Accordion from "./Accordion/Accordion.jsx";
import MediaModal from "./MediaModal/MediaModal.jsx";

const App = () => {
  const [currentProduct, setCurrentProduct] = useState([]);
  const [modal, setModal] = useState(false);
  // const [isReviewsActive, setIsReviewsActive] = useState(false);
  const [isScrolling, setIsScrolling] = useState(false);
  const [panelToShow, SetPanelToShow] = useState(null);

  const toggleModal = () => {
    setModal(!modal);
  };

  // const toggleReviewsActive = () => {
  //   setIsReviewsActive(!isReviewsActive);
  // };

  const scrollToPanel = (index) => {
    setIsScrolling((prevIsScrolling) => !prevIsScrolling);
    SetPanelToShow(index);
  };

  const ryobiDrill =
    "ONE%2B%20HP%2018V%20Brushless%20Cordless%201%2F2%20in.%20Drill%2FDriver%20and%20Impact%20Driver%20Kit%20w%2F(2)%202.0%20Ah%20Batteries%2C%20Charger%2C%20and%20Bag";

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(`/api/p/${ryobiDrill}`);
        // console.log(response.data);
        setCurrentProduct(response.data[0]);
      } catch (error) {
        console.error("Error fetching product page", error);
      }
    };
    fetchData();
  }, []); // empty dependency array so only runs when component mounts

  return (
    <main>
      <Header />
      {modal && (
        <MediaModal
          currentProduct={currentProduct}
          toggleModal={toggleModal}
          modal={modal}
        />
      )}
      <div className="item-wrapper bounding-box">
        <div className="picture-and-sidebar">
          <div className="img-gallery">
            <MediaGalleryDesktop
              currentProduct={currentProduct}
              toggleModal={toggleModal}
              // toggleReviewsActive={toggleReviewsActive}
              // isReviewsActive={isReviewsActive}
              scrollToPanel={scrollToPanel}
            />
          </div>
          <Sidebar currentProduct={currentProduct} />
        </div>
        <Accordion
          currentProduct={currentProduct}
          // toggleReviewsActive={toggleReviewsActive}
          // isReviewsActive={isReviewsActive}
          scrollToPanel={scrollToPanel}
          panelToShow={panelToShow}
          isScrolling={isScrolling}
        />
      </div>
    </main>
  );
};

export default App;
