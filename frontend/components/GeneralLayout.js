import GeneralNavbar from "./GeneralNavbar";

const GeneralLayout = ({ children }) => {
    return (
        <div>
            <GeneralNavbar />
            {children}
        </div>
    );
}

export default GeneralLayout;