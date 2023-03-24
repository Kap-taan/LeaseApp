import { createContext, useEffect, useState } from "react"
import netlifyIdentity from 'netlify-identity-widget'

const AuthContext = createContext({
    user: null,
    login: () => { },
    logout: () => { },
    authReady: false
})

export const AuthContextProvider = ({ children }) => {

    const [user, setUser] = useState(null)

    // useEffect(() => {
    //     // Initialising the connection with Netlify Identity
    //     netlifyIdentity.init()
    // }, [])

    const context = {
        user
    }


    return (
        <AuthContext.Provider value={context}>
            {children}
        </AuthContext.Provider>
    )
}

export default AuthContext