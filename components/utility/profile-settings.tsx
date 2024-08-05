import { ChatbotUIContext } from "@/context/context"
import { PROFILE_USERNAME_MAX, PROFILE_USERNAME_MIN } from "@/db/limits"
import { updateProfile } from "@/db/profile"
import { uploadProfileImage } from "@/db/storage/profile-images"
import { LLM_LIST_MAP } from "@/lib/models/llm/llm-list"
import { supabase } from "@/lib/supabase/browser-client"
import {
  IconCircleCheckFilled,
  IconCircleXFilled,
  IconLoader2,
  IconLogout,
  IconUser
} from "@tabler/icons-react"
import Image from "next/image"
import { useRouter } from "next/navigation"
import { FC, useContext, useRef, useState } from "react"
import { toast } from "sonner"
import { SIDEBAR_ICON_SIZE } from "../sidebar/sidebar-switcher"
import { Button } from "../ui/button"
import { Input } from "../ui/input"
import { Label } from "../ui/label"
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetTrigger
} from "../ui/sheet"
import { ThemeSwitcher } from "./theme-switcher"

interface ProfileSettingsProps {}

export const ProfileSettings: FC<ProfileSettingsProps> = ({}) => {
  const { profile, setProfile, envKeyMap, setAvailableHostedModels } =
    useContext(ChatbotUIContext)

  const router = useRouter()
  const buttonRef = useRef<HTMLButtonElement>(null)
  const [isOpen, setIsOpen] = useState(false)

  const [awsAccessKey, setAwsAccessKey] = useState(
    profile?.aws_access_key_id ||
      process.env.NEXT_PUBLIC_AWS_ACCESS_KEY_ID ||
      ""
  )
  const [awsSecretKey, setAwsSecretKey] = useState(
    profile?.aws_secret_access_key ||
      process.env.NEXT_PUBLIC_AWS_SECRET_ACCESS_KEY ||
      ""
  )
  const [awsSessionToken, setAwsSessionToken] = useState(
    profile?.aws_session_token ||
      process.env.NEXT_PUBLIC_AWS_SESSION_TOKEN ||
      ""
  )

  const handleSignOut = async () => {
    await supabase.auth.signOut()
    router.push("/login")
    router.refresh()
  }

  const handleSave = async () => {
    if (!profile) return

    const updatedProfile = await updateProfile(profile.id, {
      ...profile,
      aws_access_key_id: awsAccessKey,
      aws_secret_access_key: awsSecretKey,
      aws_session_token: awsSessionToken
    })

    setProfile(updatedProfile)
    toast.success("Profile updated!")

    const providers = ["aws"]

    providers.forEach(async provider => {
      const models = LLM_LIST_MAP[provider]
      const envKeyActive = envKeyMap[provider]

      if (!envKeyActive) {
        const hasApiKey =
          !!updatedProfile[`${provider}_api_key` as keyof typeof updatedProfile]

        if (hasApiKey && Array.isArray(models)) {
          setAvailableHostedModels(prev => {
            const newModels = models.filter(
              model =>
                !prev.some(prevModel => prevModel.modelId === model.modelId)
            )
            return [...prev, ...newModels]
          })
        } else if (!hasApiKey && Array.isArray(models)) {
          setAvailableHostedModels(prev =>
            prev.filter(model => !models.includes(model))
          )
        }
      }
    })

    setIsOpen(false)
  }

  const handleKeyDown = (e: React.KeyboardEvent<HTMLDivElement>) => {
    if (e.key === "Enter") {
      buttonRef.current?.click()
    }
  }

  if (!profile) return null
  return (
    <Sheet open={isOpen} onOpenChange={setIsOpen}>
      <SheetTrigger asChild>
        {profile.image_url ? (
          <Image
            className="mt-2 size-[34px] cursor-pointer rounded hover:opacity-50"
            src={profile.image_url + "?" + new Date().getTime()}
            height={34}
            width={34}
            alt={"Image"}
          />
        ) : (
          <Button size="icon" variant="ghost">
            <IconUser size={SIDEBAR_ICON_SIZE} />
          </Button>
        )}
      </SheetTrigger>

      <SheetContent
        className="flex flex-col justify-between"
        side="left"
        onKeyDown={handleKeyDown}
      >
        <div className="grow overflow-auto">
          <SheetHeader>
            <SheetTitle className="flex items-center justify-between space-x-2">
              <div>User Settings</div>

              <Button
                tabIndex={-1}
                className="text-xs"
                size="sm"
                onClick={handleSignOut}
              >
                <IconLogout className="mr-1" size={20} />
                Logout
              </Button>
            </SheetTitle>
          </SheetHeader>

          <div className="mt-4 space-y-4">
            <div className="space-y-1">
              <Label>Username: {profile.username}</Label>
            </div>

            <div className="space-y-1">
              {envKeyMap["aws_access_key_id"] ? (
                <Label>AWS Access Key ID set by admin.</Label>
              ) : (
                <>
                  <Label>AWS Access Key ID</Label>
                  <Input
                    placeholder="AWS Access Key ID"
                    type="password"
                    value={awsAccessKey}
                    onChange={e => setAwsAccessKey(e.target.value)}
                  />
                </>
              )}
              {envKeyMap["aws_secret_access_key"] ? (
                <Label>AWS Secret Access Key set by admin.</Label>
              ) : (
                <>
                  <Label>AWS Secret Access Key</Label>
                  <Input
                    placeholder="AWS Secret Access Key"
                    type="password"
                    value={awsSecretKey}
                    onChange={e => setAwsSecretKey(e.target.value)}
                  />
                </>
              )}
              {envKeyMap["aws_session_token"] ? (
                <Label>AWS Session Token set by admin.</Label>
              ) : (
                <>
                  <Label>AWS Session Token</Label>
                  <Input
                    placeholder="AWS Session Token"
                    value={awsSessionToken}
                    onChange={e => setAwsSessionToken(e.target.value)}
                  />
                </>
              )}
            </div>
          </div>
        </div>

        <div className="mt-6 flex items-center">
          <div className="flex items-center space-x-1">
            <ThemeSwitcher />
          </div>

          <div className="ml-auto space-x-2">
            <Button variant="ghost" onClick={() => setIsOpen(false)}>
              Cancel
            </Button>

            <Button ref={buttonRef} onClick={handleSave}>
              Save
            </Button>
          </div>
        </div>
      </SheetContent>
    </Sheet>
  )
}
