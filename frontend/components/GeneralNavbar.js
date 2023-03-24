
import Link from 'next/link'
import Image from 'next/image'

export default function GeneralNavbar() {
    return (
        <div className="container">
            <nav>
                <Image src="/logo.gif" width={50} height={48} />
                <h1>Lease Link</h1>
                <ul>
                    <li><Link href="/">Home</Link></li>
                    <li className='btn'>Login/Signup</li>
                </ul>
            </nav>
            <div className="banner">
                <Image src="/banner.jpg" width={966} height={276} />
            </div>
        </div>
    )
}